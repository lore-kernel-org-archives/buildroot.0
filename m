From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Apr 2018 19:23:09 -0300
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
References: <20180415214257.1e90704a@windsurf.numericable.fr>
Message-ID: <5ad3d0cda358d_54de2ad1cbb08c2828316@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 15, 2018 at 04:42 PM, Thomas Petazzoni wrote:
> On Fri, 13 Apr 2018 10:34:31 -0300, Ricardo Martincoski wrote:
> 
>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> index 33d0ae9..6a01151 100755
>> --- a/scripts/autobuild-run
>> +++ b/scripts/autobuild-run
>> @@ -291,6 +291,9 @@ def prepare_build(**kwargs):
>>      # recursively find files under root
>>      def find_files(root):
>>          for r, d, f in os.walk(root):
>> +            if '.git' in d:
>> +                d[:] = list()
>> +                continue
> 
> Just to check how this is supposed to work. We have this:
> 
>  dl/<package>/git/.git
> 
> Correct ?

Right.

> So you're idea is that when we are inside dl/<package>/git/, one of the
> sub-directories is .git, and therefore we shouldn't remove anything in
> dl/<package>/git/ ?

Yes. My idea is to keep the behavior described in the comment:
# Remove 5 random files from the download directory. Removing
# random files from the download directory allows to ensure we
# regularly re-download files to check that their upstream
# location is still correct.

So we keep testing in autobuilders that the upstream location is correct (the
git fetch fails and therefore the download script fails if the server does not
respond even in the case we already have the commits and references we need in
the cache; it is the correct behavior IMO), and we also test the generation of
tarball, but we do not test the re-download with a clean git cache; this could
be done later on autobuilder with extra code (maybe remove only 1 git cache
every run together to 5 tarballs?), but the most important scenario is already
tested: the use of git cache in the long run.

> 
> My concern is that I'm not sure if what you've done prevents from
> removing files inside dl/<package>/git or only inside
> dl/<package>/git/.git. I would find it more to do something like:

It prevents from removing files inside dl/<package>/git

> 
> 	if "git" in d:
> 		d.remove("git")
> 
> but perhaps you haven't done this for some good reason ?

Yes, we want to eventually remove dl/git/git-2.16.3.tar.xz
Sorry. It should be in a comment or in the commit log.

> 
> Another concern is how to fix those autobuilders that have already
> removed some random files from their cached Git repositories? Should we
> ask the people who run those autobuilders to entirely wipe the download
> folders of their autobuilder instances ? Or do we have a smart (but
> simple) thing to do to avoid this ?

I agree with Yann about the ditch + restart for broken git cache.
But if you want, maybe in one autobuilder instance we can manually remove all
git caches just to know earlier (before applying Yann's series) that no more
download issues will occur, since this change to the script prevents corrupting
new git caches.
I guess but did not tested this command would be enough:
rm -r instance-0/dl/*/git
Your call. I have no preference.

But leaving at least one instance not fixed (with some git cache broken) can
help to test Yann's series.

Regards,
Ricardo
