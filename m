From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 17:24:18 +0100
Subject: [Buildroot] [PATCH 1/2] kismet: Remove libpcap compile tests to
 fix cross-compiling
In-Reply-To: <1418395681-40434-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418395681-40434-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141226162418.GF3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-12-12 14:48 +0000, Vicente Olivert Riera spake thusly:
> These compile tests are run on the host machine which may have or may
> not have libpcap installed, so we are relying on the host machine to
> determine if we have to stop the build process due to a missing pcap
> library. Given that Kismet already depends on libpcap we can be sure
> that library will be installed in our target. So, for these two reasons
> we can remove these compile tests from the configure script.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/965/965a3e345dc0a432043b72581bff7d33561fbe0c/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...pcap-compile-tests-to-fix-cross-compiling.patch |  104 ++++++++++++++++++++
>  1 files changed, 104 insertions(+), 0 deletions(-)
>  create mode 100644 package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch
> 
> diff --git a/package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch b/package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch
> new file mode 100644
> index 0000000..d41c64e
> --- /dev/null
> +++ b/package/kismet/0003-Remove-libpcap-compile-tests-to-fix-cross-compiling.patch
> @@ -0,0 +1,104 @@
> +Remove libpcap compile tests to fix cross-compiling
> +
> +These compile tests are run on the host machine which may have or may
> +not have libpcap installed, so we are relying on the host machine to
> +determine if we have to stop the build process due to a missing pcap
> +library. Given that Kismet already depends on libpcap we can be sure
> +that library will be installed in our target. So, for these two reasons
> +we can remove these compile tests from the configure script.
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +
> +diff -rup a/configure b/configure
> +--- a/configure	2014-12-11 16:35:36.979059147 +0000
> ++++ b/configure	2014-12-11 16:43:54.175647454 +0000

You are patching configure instead of configure.in.

However, I could not observe what you describe in the commit log. In my
case, the libpcap is really checked with the cross-compiler:

    configure:6258: checking for pcap_open_live in -lpcap
    configure:6283: /home/ymorin/dev/buildroot/O/host/usr/bin/arm-none-linux-gnueabi-gcc [...]
    configure:6283: $? = 0
    configure:6293: result: yes
    [...]
    configure:6378: checking for pcap_get_selectable_fd in -lpcap
    configure:6403: /home/ymorin/dev/buildroot/O/host/usr/bin/arm-none-linux-gnueabi-gcc [...]
    configure:6403: $? = 0
    configure:6413: result: yes
 
But that's maybe because I now autoreconf kismet, since my ncurses-related
patch already touches configure.in.

So I've marked this patch as "Rejected" in Patchwork, as it seems it is
no longer needed.

In case you still have issues with the pcap stuff, feel free to resubmit
the patch with extra information.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
