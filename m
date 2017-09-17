From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 17 Sep 2017 02:20:04 -0300
Subject: [Buildroot] [PATCH 1/2] support/run-tests: move packages tests
 to packages directories
References: <bead9472ebddf2faaa023fd64dfe511e48827b0f.1505594291.git.yann.morin.1998@free.fr>
Message-ID: <59be0604174a3_76dff67c8c964d2@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Sep 16, 2017 at 05:38 PM, Yann E. MORIN wrote:

> Move the existing few packages' tests to the correspnding package

typo:                                          corresponding

> directories.
> 
> If we were to add the package/ directory to nose2's search path, we
> would have to add __init__.py files about everywhere, at each level of
> the directory hierarchy, because nose2 only includes tests that are in a
> python pacakge (a directory with a __init__.py file is a python package).

typo:    package

> This is far from ideal, especially since we have absolutely nothing to
> put in those __init__.py files.
> 
> An alternative is to just scan the package/ directory ourselves, and
> create symlinks in a sub-directory of support/tessting/tests/ so that

typo:                                           testing

> nose2 does find them. We have no two packages with the same name, we
> don't risk having two symlinks with the same name.
> 
> That second solution is what we choose to do, at the cost of a slight
> increase in complexity in the run-test script.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  .gitignore                                         |  1 +
>  .../dropbear/dropbear.py                           |  0
>  .../python-ipython/python-ipython.py               |  0
>  .../test_python.py => package/python/python.py     |  0
>  support/testing/run-tests                          | 22 ++++++++++++++++++++++
>  support/testing/tests/package/__init__.py          |  0
>  6 files changed, 23 insertions(+)
>  rename support/testing/tests/package/test_dropbear.py => package/dropbear/dropbear.py (100%)
>  rename support/testing/tests/package/test_ipython.py => package/python-ipython/python-ipython.py (100%)

.gitlab-ci.yml needs to be generated again because of this rename.

As I mentioned in another thread, having Python files with '-' in their name
AFAIK is not a problem as long we don't want to import them.
We currently import only test_python.py and it seems unlikely to have runtime
tests importing each other.

And this series is really changing the filename convention for runtime tests of
packages, making the pre-existing convention of package files beat the
convention inside the test infra. I am OK with this change, but I think it worth
mentioning. Perhaps it fits in the commit log?

[snip]
> @@ -36,6 +39,9 @@ def main():
>      script_path = os.path.realpath(__file__)
>      test_dir = os.path.dirname(script_path)
>  
> +    gatheradditionaltests(os.path.abspath("."),

Below you run all files in this path (base dir of buildroot) to match against
the regex. It's bad because one can have output/, test-output/, test-dl/,
outgoing/, ...

Also os.getcwd() should give the same result and it is already used in 
support/testing/infra/__init__.py

So for now I suggest to change to:
gather_additional_tests(os.path.join(os.getcwd(), "package"),
And if fs tests gets moved, just add another call to the same method.
We don't have that many subdirectories in the root directory.

Other way around is to pass an array of relative subdirectories
gather_additional_tests(["package", "fs"],
and compose the absolute path inside the method while iterating over the
entries.

> +                          os.path.join(test_dir,"tests","package"))

Here and all over the file there are missing whitespace after ','
Can you use flake8 to find them and fix it?

If you use vim you can do
:set makeprg=flake8\ %
:make
and it will jump the cursor to the right place

> +
>      if args.stdout:
>          BRTest.logtofile = False
>  
> @@ -116,5 +122,21 @@ def main():
>  
>      nose2.discover(argv=nose2_args)
>  
> +def gatheradditionaltests(search_dir, symlink_dir):

You could call it gather_additional_tests.

> +    try:
> +        shutil.rmtree(symlink_dir)
> +    except OSError as err:
> +        if not err.errno == errno.ENOENT:
> +            raise err
> +        pass

Could we do just this? (like is done in builder.py)
    if os.path.exists(symlink_dir):
        shutil.rmtree(symlink_dir)
If you change this, errno doesn't need to be imported.

> +    os.mkdir(symlink_dir)
> +    open(os.path.join(symlink_dir,"__init__.py"), "w").close()
> +    for dir, _, files in os.walk(os.path.abspath(search_dir)):

I first thought, why not glob.glob? But in Python 2 it is not recursive.
So indeed os.walk is the way to go.

> +        package = os.path.basename(dir)
> +        for file in files:

You can import fnmatch to drastically reduce the number of regex compilations:
        for file in fnmatch.filter(files, '*.py'):

> +            if re.match("^{}.py$".format(package),file):
> +                os.symlink(os.path.join(dir,file),
> +                           os.path.join(symlink_dir,"test_{}.py".format(package)))

Regards,
Ricardo
