From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 12:05:13 +0200
Subject: [Buildroot] [PATHC v3] package/dcron: create required
 directories at startup
In-Reply-To: <20200829234246.74ce67dc@windsurf.home>
References: <20191117030942.3009-1-unixmania@gmail.com>
 <20200829234246.74ce67dc@windsurf.home>
Message-ID: <cf72fc11-07a2-ef04-e476-55486fe922aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/08/2020 23:42, Thomas Petazzoni wrote:
> Hello,
> 
> I know Carlos is no longer actively working on Buildroot, but we still
> have this patch pending in patchwork, and we need to do something about
> it. I have some comments/questions below.
> 
> On Sun, 17 Nov 2019 00:09:42 -0300
> unixmania at gmail.com wrote:
> 
>> From: Carlos Santos <unixmania@gmail.com>
>>
>> crond uses the /var/spool/cron/{crontabs,cronstamps} directories to
>> store the per-user crontabs and timestamps for jobs, respectively.
>>
>> On systems with busybox or sysv init, /var/spool is by default a link to
>> /tmp (see package/skeleton-init-sysv/skeleton/). So if those directories
>> are created at installation time they will actually be under /tmp/spool
>> and will vanish at run time when a tmpfs is mounted at /tmp. In this
>> case crond issues error messages that can't be seen.
> 
> From a quick grep, it seems like dcron.mk is the only package creating
> folders in /var/spool at build time, but of course, it's always
> possible for other packages to do that within their own build system.
> That would leave stale files in /tmp, which are present in the image
> (taking up space), but in fact useless as we mount a tmpfs on top of
> /tmp.

 It may make sense to have a build-time check that /tmp is empty, so we can
figure out how to solve issues like this.

> This issue is taken care of by
> https://patchwork.ozlabs.org/project/buildroot/patch/20200605224858.12870-2-nolange79 at gmail.com/,
> which is still pending. To me, it seems like a good idea.
> 
> However, I don't know if this has already been discussed, but looking
> at, I find our symlinks to ../tmp potentially dangerous:
> 
> lrwxrwxrwx 1 thomas thomas    6 26 mars  17:10 cache -> ../tmp
> drwxr-xr-x 2 thomas thomas 4096 26 mars  17:10 lib
> lrwxrwxrwx 1 thomas thomas    6 26 mars  17:10 lock -> ../tmp
> lrwxrwxrwx 1 thomas thomas    6 26 mars  17:10 log -> ../tmp
> lrwxrwxrwx 1 thomas thomas    6 26 mars  17:10 run -> ../run
> lrwxrwxrwx 1 thomas thomas    6 26 mars  17:10 spool -> ../tmp
> lrwxrwxrwx 1 thomas thomas    6 26 mars  17:10 tmp -> ../tmp
> 
> It means that at runtime, if you're access /var/cache/foobar and
> /var/log/foobar, it's the same thing. Isn't that potentially a problem ?

 I think that usually the file names will be different anyway.

 That said, it would probably be much better if we did the following:

- create directories for all these in /tmp;
- let packages create files in those directories;
- in finalize, enumerate everything that has been created and put it in a file;
- create either an init script or a tmpfiles fragment to re-create that stuff at
boot.

 Any non-empty file that is created in /tmp should probably be a hard error.

 I think we have a few init scripts at the moment that have workarounds which
could be removed if the above approach is taken (e.g. dropbear, though the
warning that is issued could be useful).

 Regards,
 Arnout

>> The error is hidden because we use start-stop-daemon to run crond in
>> foreground mode to create a pid file and move crond to background. In
>> this mode crond does not use syslog and all error messages are lost
>> because start-stop-daemon redirects stderr to /dev/null.
> 
> To me, this is a problem that is not directly related to the /var/spool
> directories issue. We have plenty of other packages for which we use
> start-stop-daemon -m with the daemon started in foreground that maybe
> doesn't use syslog.
> 
> So at the very least, this should be part of a separate commit, since
> it's a separate problem. And I'm not sure we want the lengthy patch
> that still hasn't been accepted upstream (I pinged today on the pull
> request, just in case).
> 
>> Fix these problem by means of the following changes:
>>
>> - Pull a patch already submitted upstream[1] to create a pidfile, so we
>>   can start crond in daemon mode.
>> - Do not create the crontabs and cronstamps directories in the package
>>   installation.
>> - Rewrite S90dcron (following the current template) changing the startup
>>   method and ensuring that the required directories exist.
> 
> This is also mixing the rewrite of the init script to follow the
> template and the adaptation to create the missing directories.
> 
> Yann, Peter, Arnout, what do you think ?
> 
> Best regards,
> 
> Thomas
> 
