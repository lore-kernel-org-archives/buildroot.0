From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 14 Jul 2015 22:58:23 -0500
Subject: [Buildroot] [PATCH] dnsmasq: bump to version 2.73
In-Reply-To: <1434804976-8637-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434804976-8637-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CALq67GDUHTUQbp1wfqv_zfzP4u3Zzcq5-kJ_Fm2gmStturqOjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Sat, Jun 20, 2015 at 7:56 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dnsmasq/dnsmasq.hash | 2 +-
>  package/dnsmasq/dnsmasq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -DNSMASQ_VERSION = 2.72
> +DNSMASQ_VERSION = 2.73

Tonight I was trying to use dnsmasq tonight for the first time for DNS
and DHCP functionality. I'm unable to successfully start the
application as it segs fault. After some debugging with strace turns
out with the new version (2.73) of dnsmasq requires /tmp/resolv.conf
to exist (actually /etc/resolv.conf since it sim links to
/tmp/resolv.conf) even if you have the 'no-resolv' option specified in
the config file. Below is the output from strace:

lstat64("/etc", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/etc/resolv.conf", {st_mode=S_IFLNK|0777, st_size=18, ...}) = 0
readlink("/etc/resolv.conf", "../tmp/resolv.conf", 4095) = 18
lstat64("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=100, ...}) = 0
lstat64("/tmp/resolv.conf", 0xbea996f8) = -1 ENOENT (No such file or directory)
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x4b5d0} ---
+++ killed by SIGSEGV +++
Segmentation fault

I've verified if, 1) I revert this commit everything works or 2) if I
add a touch to /tmp/resolv.conf to the S80dnsmasq startup script
before invoking dnsmasq.

How do we want to address this issue? Is option 2 preferable?

Currently I'm not finding anything helpful on resolving this issue but
it does appear there is some traffic on the mailing list for dnsmasq:

https://www.mail-archive.com/dnsmasq-discuss at lists.thekelleys.org.uk/msg09635.html

Thanks,
-Ryan
