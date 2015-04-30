From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Thu, 30 Apr 2015 20:20:10 +0200
Subject: [Buildroot] [autobuild v2 3/3] autobuild-run: allow to change
 default git uri and branch on the command line
In-Reply-To: <CAHXCMMLtBHfT22gaYVSuUJKb6kJn9MdPkNPXLRfoo5uYa9A4bA@mail.gmail.com>
References: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
 <1430338217-25518-3-git-send-email-s.martin49@gmail.com>
 <55415A47.4080108@mailerd.de>
 <CAHXCMMLtBHfT22gaYVSuUJKb6kJn9MdPkNPXLRfoo5uYa9A4bA@mail.gmail.com>
Message-ID: <CAGrucu3-M+psTLpAD5B1-xeT-q0ctUQfw09RyG6Gk7odoH+4jA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2015-04-30 7:20 GMT+02:00 Samuel Martin <s.martin49@gmail.com>:
> Hi Andre, all,
>
> Thanks a lot for your review.
>
> On Thu, Apr 30, 2015 at 12:25 AM, Andr? Erdmann <dywi@mailerd.de> wrote:
>> 2015/4/29 Samuel Martin <s.martin49@gmail.com>:
>>> This is useful when hacking the autobuild-run script on some specific
>>> Buildroot tree, or to run the script with custom tree.
>>>
>>> Result upload is automatically disable when one of these setting are not
>>> the default ones.
>>>
>>> Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>>
>>> ---
>>> changes v1->v2:
>>> - use cmdline options instead of env. vars.
>>> ---
>>>  scripts/autobuild-run | 41 +++++++++++++++++++++++++++++++++--------
>>>  1 file changed, 33 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>>> index 01e3265..427d333 100755
>>> --- a/scripts/autobuild-run
>>> +++ b/scripts/autobuild-run
>>> @@ -57,6 +57,9 @@
>>>
>>>  from __future__ import print_function
>>>
>>> +BUILDROOT_GIT_REPO_URI = "git://git.busybox.net/buildroot"
>>> +BUILDROOT_GIT_BRANCH = "master"
>>> +
>>>  # Don't tell docopt about the defaults, as it would not allow the following
>>>  # priority hierarchy for arguments: command-line > config file > defaults
>>>  defaults = {
>>> @@ -64,6 +67,8 @@ defaults = {
>>>      '--njobs': '1',
>>>      '--submitter': 'N/A',
>>>      '--make-opts': '',
>>> +    '--br-git-uri': BUILDROOT_GIT_REPO_URI,
>>> +    '--br-git-branch': BUILDROOT_GIT_BRANCH,
>>>  }
>>>
>>>  doc = """autobuild-run - run Buildroot autobuilder
>>> @@ -84,6 +89,14 @@ Options:
>>>    --make-opts OPTSTRING          string of extra options to pass to Buildroot
>>>                                   make, such as specific command wrappers
>>>                                   [default: ]
>>> +  --br-git-uri GIT_REPO_URI      Buildroot git repository uri used from the instances.
>>> +                                 When an alternative git repo uri is set, result uplaod
>>> +                                 is disabled.
>>> +                                 [default: the official Buildroot repository]
>>
>> Don't add "[default: <sth>]" here - <sth> will end up in the config ("args" variable),
>> and has higher priority than any other configuration method (config file, defaults).
>>
>> The result is that if you run autobuild-run without "--br-git-uri ...", it will try
>> to fetch from "the official Buildroot repository" and not "git://..." (BUILDROOT_GIT_REPO_URI).
>>
>
> So, we cannot document the defaults in the doc if we also want to make
> them available in the config file... :-/
>

The defaults get automatically added at the end of the help message,
below "Default values for the arguments are:".


> So the options are:
> - either we correctly set the default git uri/branch in the doc
> string, but we cannot set them via the config file;
> - or we remove them from the doc, and we can still set them via the config file.
> Inputs on this point from actual users will be helpful.
>
>>> +  --br-git-branch GIT_BRANCH     Buildroot git branch used for the instance
>>> +                                 When an alternative git branch is set, result uplaod
>>> +                                 is disabled.
>>> +                                 [default: master]
>>
>> The same applies here.
>>
>>>    -c, --config CONFIG            path to configuration file
>>>
>>>  Format of the configuration file:
>>> @@ -98,6 +111,8 @@ Format of the configuration file:
>>>     http-login = <value>
>>>     http-password = <value>
>>>     submitter = <value>
>>> +   br-git-uri = <value>
>>> +   br-git-branch = <value>
>>>
>>>  Default values for the arguments are:
>>>
>>> @@ -296,17 +311,17 @@ def prepare_build(**kwargs):
>>>
>>>      # Clone Buildroot. This only happens if the source directory
>>>      # didn't exist already.
>>> -    srcdir = os.path.join(idir, "buildroot")
>>> +    srcdir = os.path.abspath(os.path.join(idir, "buildroot"))
>>>      if not os.path.exists(srcdir):
>>> -        ret = subprocess.call(["git", "clone", "git://git.busybox.net/buildroot", srcdir],
>>> +        ret = subprocess.call(["git", "clone", "-b", kwargs['br_git_branch'],
>>> +                              kwargs['br_git_repo_uri'], srcdir],
>>>                                stdout=log, stderr=log)
>>>          if ret != 0:
>>>              log_write(log, "ERROR: could not clone Buildroot sources")
>>>              return -1
>>>
>>>      # Update the Buildroot sources.
>>> -    abssrcdir = os.path.abspath(srcdir)
>>> -    ret = subprocess.call(["git", "pull"], cwd=abssrcdir, stdout=log, stderr=log)
>>> +    ret = subprocess.call(["git", "pull"], cwd=srcdir, stdout=log, stderr=log)
>>
>> --br-git-{uri,branch} are ignored if srcdir already exists,
>> which should be documented or changed code-wise.
>>
>> I'd add a note to the help message for now
>> ("applies to new instance directories" or so).
>
> I figured that too, but forgot to mention it :-/
> I also prefer handling this in another patch ;-)
>
> Another solution (not tested, btw) could be emptying the instance
> directories at the beginning of the script, how about this?
>

In my view, reusing files is an essential feature, because it keeps
the bandwidth requirements at a reasonable level.

If you wipe the instance directories, you lose both the git dirs and
src download dirs (*) whenever the script is started (server reboot,
local testing, ...).

Another approach would be to remove the instances' git srcdirs only
(how to detect that an "rm -r" is necessary?), but my preferred
solution would be having a single git mirror directory maintained
(i.e. regularly updated)) by the "master" process and let worker
processes clone/pull from it.

(*) side note: as part of the build process, worker processes remove a
few randomly chosen files from the dl dir to ensure that these files
can be re-downloaded.


> [snip]


-- 
Andr?
