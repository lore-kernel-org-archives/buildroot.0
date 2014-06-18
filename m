From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Jun 2014 13:51:27 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <20140618102531.34c6f3ea@free-electrons.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
 <20140617130025.664a1df6@free-electrons.com>
 <CAAXf6LVfQJvMQjHdvD+M_3HVLtD=h_bVoq=x8UP1WrPDYGc_Uw@mail.gmail.com>
 <20140618102531.34c6f3ea@free-electrons.com>
Message-ID: <CAAXf6LXqEH7qu_u_XkWcGODETc5wv8WsRxUyAAASoH8kTmObkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jun 18, 2014 at 10:25 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>> 1. One run showed the following error, any ideas?
>>
>> [Tue, 17 Jun 2014 21:39:33] INFO: preparing a new build
>> [Tue, 17 Jun 2014 21:39:33] INFO: removing cmake-2.8.12.2.tar.gz from downloads
>> [Tue, 17 Jun 2014 21:39:33] INFO: removing sam-ba_2.12_patch5.gz from downloads
>> [Tue, 17 Jun 2014 21:39:33] INFO: removing m4-1.4.17.tar.xz from downloads
>> [Tue, 17 Jun 2014 21:39:33] INFO: removing libcdio-0.92.tar.gz from downloads
>> [Tue, 17 Jun 2014 21:39:33] INFO: removing wsapi-1.6.1-1.src.rock from downloads
>> Already up-to-date.
>> [Tue, 17 Jun 2014 21:42:42] INFO: generate the configuration
>> [Tue, 17 Jun 2014 21:42:45] ERROR: cannot savedefconfig
>
> No, not at this point. I guess I should redirect more of the output to
> the logfile instead of /dev/null. You can try the following patch to
> store in the logfile the output of the savedefconfig:
>
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 06fb430..7dba760 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -302,7 +302,7 @@ def gen_config(instance, njobs, log):
>          return -1
>
>      ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
> -                          stdout=devnull, stderr=devnull)
> +                          stdout=log, stderr=log)
>      if ret != 0:
>          log_write(log, "ERROR: cannot savedefconfig")
>          return -1
>

In the mean time another such issue popped up, here is the output:

make: Entering directory `/repo/tdescham/autobuild/workdir/instance-0/buildroot'
package/luajit/luajit.mk:67: *** Configuration error: both "luajit"
and "lua" are selected as providers for virtual package
"luainterpreter". Only one provider can be selected at a time. Please
fix your configuration.  Stop.
make: Leaving directory `/repo/tdescham/autobuild/workdir/instance-0/buildroot'
[Wed, 18 Jun 2014 13:42:43] ERROR: cannot savedefconfig


We already talked about such problems before, did you already have a
solution implemented in the original autobuild instance?

Best regards,
Thomas
