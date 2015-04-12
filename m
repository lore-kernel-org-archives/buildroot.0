From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 20:06:39 +0200
Subject: [Buildroot] [autobuild 4/4] autobuild-run: allow to change
 default git uri and branch through env. vars.
In-Reply-To: <20150412192640.5b6089b3@free-electrons.com>
References: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
 <1428849285-21092-4-git-send-email-s.martin49@gmail.com>
 <20150412192640.5b6089b3@free-electrons.com>
Message-ID: <CAHXCMM+96Fz3se75bnqx7oY9zT0a1ToLV8poNm_fVbpwnj=CZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 12, 2015 at 7:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun, 12 Apr 2015 16:34:45 +0200, Samuel Martin wrote:
>> This is useful when hacking the autobuild-run script on some specific
>> Buildroot tree.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  scripts/autobuild-run | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> index dbfc33e..e1c6c5d 100755
>> --- a/scripts/autobuild-run
>> +++ b/scripts/autobuild-run
>> @@ -102,6 +102,16 @@ Format of the configuration file:
>>  Default values for the arguments are:
>>
>>    %s
>> +
>> +Environment variables:
>> +
>> +  BUILDROOT_GIT_REPO_URI
>> +    This environment variable allows to fetch the given Buildroot git repository
>> +    instead of the official one.
>> +
>> +  BUILDROOT_GIT_BRANCH
>> +    This environment variable allows to change the Buildroot git branch instead
>> +    of master.
>>  """ % '\n  '.join(
>>      ['%s = %s' % (key, val) for (key, val) in defaults.items()])
>>
>> @@ -297,8 +307,10 @@ def prepare_build(**kwargs):
>>      # Clone Buildroot. This only happens if the source directory
>>      # didn't exist already.
>>      srcdir = os.path.join(idir, "buildroot")
>> +    br_repo = os.environ.get("BUILDROOT_GIT_REPO_URI", "git://git.busybox.net/buildroot")
>> +    br_branch = os.environ.get("BUILDROOT_GIT_BRANCH", "master")
>>      if not os.path.exists(srcdir):
>> -        ret = subprocess.call(["git", "clone", "git://git.busybox.net/buildroot", srcdir],
>> +        ret = subprocess.call(["git", "clone", "-b", br_branch, br_repo, srcdir],
>>                                stdout=log, stderr=log)
>>          if ret != 0:
>>              log_write(log, "ERROR: could not clone Buildroot sources")
>
> Why environment variables?
Nothing else than offering a way to use a custom (buggy) tree to test
the autobuild-run script.

> http://patchwork.ozlabs.org/patch/394526/
> was proposing to use options, which was much better IMO. If you could
> take this approach (after refreshing the patch), I would be OK.
Fair enough. In fact I wrote the code before Yann mentioned it on
IRC... so, the patch flies away with the others ;)
I'll take this in my stack.

>
> Note that in the patch from Matt Weber, I also explicitly asked that
> when a non-default repo/branch is used, the script should refuse to
> submit the results to autobuild.b.o.
Make totally sense.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,

-- 
Samuel
