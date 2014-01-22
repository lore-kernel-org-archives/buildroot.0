From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 09:58:27 +0100
Subject: [Buildroot] [PATCH 1/1] Fixed tcpreplay auto build errors
In-Reply-To: <CAFOYHZDW+N_0oOYDCigr8-hG=vP-wW=Yey7ADrponotyXnxRFg@mail.gmail.com>
 (Chris Packham's message of "Wed, 22 Jan 2014 16:07:10 +1300")
References: <1390300886-15282-1-git-send-email-martin@barkynet.com>
 <CAFOYHZDW+N_0oOYDCigr8-hG=vP-wW=Yey7ADrponotyXnxRFg@mail.gmail.com>
Message-ID: <87vbxce6ks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > On Tue, Jan 21, 2014 at 11:41 PM, Martin Bark <martin@barkynet.com> wrote:
 >> tcpreplay fails to compile unless it finds the tcpdump binary.  This patch
 >> makes tcpreplay dependent on tcpdump and sets the configure script to use
 >> tcpdump on the target
 >> 
 >> Signed-off-by: Martin Bark <martin@barkynet.com>
 >> ---
 >> package/tcpreplay/Config.in    |    1 +
 >> package/tcpreplay/tcpreplay.mk |    5 +++--
 >> 2 files changed, 4 insertions(+), 2 deletions(-)
 >> 
 >> diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
 >> index 2ba2eb5..49c3284 100644
 >> --- a/package/tcpreplay/Config.in
 >> +++ b/package/tcpreplay/Config.in
 >> @@ -2,6 +2,7 @@ config BR2_PACKAGE_TCPREPLAY
 >> bool "tcpreplay"
 >> depends on BR2_USE_MMU # fork()
 >> select BR2_PACKAGE_LIBPCAP
 >> +       select BR2_PACKAGE_TCPDUMP
 >> help
 >> Tcpreplay is a tool for replaying network traffic from files saved
 >> with tcpdump or other tools which write pcap(3) files.
 >> diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
 >> index 0939c6c..f6a7c85 100644
 >> --- a/package/tcpreplay/tcpreplay.mk
 >> +++ b/package/tcpreplay/tcpreplay.mk
 >> @@ -11,8 +11,9 @@ TCPREPLAY_LICENSE_FILES = docs/LICENSE
 >> TCPREPLAY_CONF_ENV = \
 >> tr_cv_libpcap_version=">= 0.7.0" \
 >> ac_cv_have_bpf=no
 >> -TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 >> -TCPREPLAY_DEPENDENCIES = libpcap
 >> +TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr \
 >> +       --with-tcpdump=$(TARGET_DIR)/usr/sbin/tcpdump
 >> +TCPREPLAY_DEPENDENCIES = libpcap tcpdump

This doesn't work, as tcpreplay then ends up trying to execute
$(TARGET_DIR)/usr/bin/tcpdump on the target, which doesn't exist.

We also cannot set it to /usr/sbin/tcpdump (the target path), as the
configure script errors out if that isn't available on the build host :/

The configure script doesn't really take cross compilation into
consideration, so I guess we need to patch it to only warn if the binary
isn't available.


 >> 
 >> # libpcap may depend on symbols in libusb as well
 >> TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
 >> --
 >> 1.7.9.5

 > I think it would be nice if tcpreplay could build without tcpdump (on
 > the host or target). In the meantime this seems like the best
 > solution.


Why don't we just fix the real problem (E.G. the buggy
tcpreplay_seterr() macro)?

I took a look now that we can reproduce it, and the problem is that the
macro expects atleast 3 arguments, and it gets called with only 2 when
tcpdump isn't found:

tcpreplay_seterr(ctx, "verbose mode not supported");

The definition of tcpreplay_seterr is:

#define tcpreplay_seterr(x, y, ...) __tcpreplay_seterr(x, __FUNCTION__, __LINE__, __FILE__, y, __VA_ARGS__)
void __tcpreplay_seterr(tcpreplay_t *ctx, const char *func, const int line, const char *file, const char *fmt, ...);

And the fix is just to get rid of the explicit y parameter:

#define tcpreplay_seterr(x, ...) __tcpreplay_seterr(x, __FUNCTION__, __LINE__, __FILE__, __VA_ARGS__)

Just like the GCC documentation suggests:

http://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html


Care to send a patch (upstream and to buildroot) to fix this?


We also need to add:

# don't build in tcpdump support if the build host has it
TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=no

to tcpreplay.mk to forcible disable tcpdump support.

-- 
Bye, Peter Korsgaard
