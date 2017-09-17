From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Sep 2017 09:18:44 +0200
Subject: [Buildroot] [PATCH 1/2] support/run-tests: move packages tests
 to packages directories
In-Reply-To: <59be0604174a3_76dff67c8c964d2@ultri3.mail>
References: <bead9472ebddf2faaa023fd64dfe511e48827b0f.1505594291.git.yann.morin.1998@free.fr>
 <59be0604174a3_76dff67c8c964d2@ultri3.mail>
Message-ID: <20170917071844.GA2930@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-09-17 02:20 -0300, Ricardo Martincoski spake thusly:
> On Sat, Sep 16, 2017 at 05:38 PM, Yann E. MORIN wrote:
> > ---
> >  .gitignore                                         |  1 +
> >  .../dropbear/dropbear.py                           |  0
> >  .../python-ipython/python-ipython.py               |  0
> >  .../test_python.py => package/python/python.py     |  0
> >  support/testing/run-tests                          | 22 ++++++++++++++++++++++
> >  support/testing/tests/package/__init__.py          |  0
> >  6 files changed, 23 insertions(+)
> >  rename support/testing/tests/package/test_dropbear.py => package/dropbear/dropbear.py (100%)
> >  rename support/testing/tests/package/test_ipython.py => package/python-ipython/python-ipython.py (100%)
> As I mentioned in another thread, having Python files with '-' in their name
> AFAIK is not a problem as long we don't want to import them.
> We currently import only test_python.py and it seems unlikely to have runtime
> tests importing each other.

Yet we don't know what the future will be made of, so we should squash
the dasj into an underscore, so as to allow this kind of situation.

> And this series is really changing the filename convention for runtime tests of
> packages, making the pre-existing convention of package files beat the
> convention inside the test infra. I am OK with this change, but I think it worth
> mentioning. Perhaps it fits in the commit log?

Yes, it does change the naming convention. I was about to add it to our
manual, in the section about adding new packages, to document the .py
file in addition to Config.in and the .mk and .hash files. But then I
noticed we had nothing about the runtime tests in the manual, so I could
not refer to that section to explain the .py file.

So I deferred updating the manual for later.

> [snip]
> > @@ -36,6 +39,9 @@ def main():
> >      script_path = os.path.realpath(__file__)
> >      test_dir = os.path.dirname(script_path)
> >  
> > +    gatheradditionaltests(os.path.abspath("."),
> 
> Below you run all files in this path (base dir of buildroot) to match against
> the regex. It's bad because one can have output/, test-output/, test-dl/,
> outgoing/, ...

Arg, I initially wanted to only scan package/ in fact.

> Also os.getcwd() should give the same result and it is already used in 
> support/testing/infra/__init__.py
> 
> So for now I suggest to change to:
> gather_additional_tests(os.path.join(os.getcwd(), "package"),

Except that both your solution and mine break when the script is not
called from the Buildroot top directory. We must derive the top
directory from the script path.

> And if fs tests gets moved, just add another call to the same method.
> We don't have that many subdirectories in the root directory.
> 
> Other way around is to pass an array of relative subdirectories
> gather_additional_tests(["package", "fs"],
> and compose the absolute path inside the method while iterating over the
> entries.

I think the origin directory should be passed as argument to the
function, for the above reason.

And yes, we could pass a list of directories.

> > +                          os.path.join(test_dir,"tests","package"))
> 
> Here and all over the file there are missing whitespace after ','
> Can you use flake8 to find them and fix it?

Yup, will do.

> If you use vim you can do
> :set makeprg=flake8\ %
> :make
> and it will jump the cursor to the right place
> 
> > +
> >      if args.stdout:
> >          BRTest.logtofile = False
> >  
> > @@ -116,5 +122,21 @@ def main():
> >  
> >      nose2.discover(argv=nose2_args)
> >  
> > +def gatheradditionaltests(search_dir, symlink_dir):
> 
> You could call it gather_additional_tests.

I never know whatThe_prefered_Solutionis. ;-)

> > +    try:
> > +        shutil.rmtree(symlink_dir)
> > +    except OSError as err:
> > +        if not err.errno == errno.ENOENT:
> > +            raise err
> > +        pass
> 
> Could we do just this? (like is done in builder.py)
>     if os.path.exists(symlink_dir):
>         shutil.rmtree(symlink_dir)
> If you change this, errno doesn't need to be imported.

So I am no Python expert, and this shows. Thanks for the hints! :-)

> > +    os.mkdir(symlink_dir)
> > +    open(os.path.join(symlink_dir,"__init__.py"), "w").close()
> > +    for dir, _, files in os.walk(os.path.abspath(search_dir)):
> 
> I first thought, why not glob.glob? But in Python 2 it is not recursive.
> So indeed os.walk is the way to go.
> 
> > +        package = os.path.basename(dir)
> > +        for file in files:
> 
> You can import fnmatch to drastically reduce the number of regex compilations:
>         for file in fnmatch.filter(files, '*.py'):

Wee! :-)

> > +            if re.match("^{}.py$".format(package),file):
> > +                os.symlink(os.path.join(dir,file),
> > +                           os.path.join(symlink_dir,"test_{}.py".format(package)))
> 
> Regards,
> Ricardo


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
