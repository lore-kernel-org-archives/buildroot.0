From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 26 Feb 2012 17:23:54 +0100
Subject: [Buildroot] [git commit branch/next] Makefile: move cmake
 toolchain file to $HOST_DIR/usr/share/buildroot
In-Reply-To: <20120225222047.D914690B6D@busybox.osuosl.org>
References: <20120225222047.D914690B6D@busybox.osuosl.org>
Message-ID: <CAHXCMMLHtBx0F6pYBJdRVt+0EsMMOjgr3bsFkyYX3iiRdWDcuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/2/25 Peter Korsgaard <jacmet@sunsite.dk>:
> commit: http://git.buildroot.net/buildroot/commit/?id=ed7791e2e8cdade564a5f484cdfe62ffe16cb981
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>
> To make it part of the SDK installation.
>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?Makefile ? ? ? ? ? ? ? ? ?| ? ?5 +++--
> ?package/Makefile.cmake.in | ? ?2 +-
> ?2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d5cd8f0..9a07f9f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -368,7 +368,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
> ?dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> ? ? ? ?$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
>
> -$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
> +$(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake

Nack.
Doing things in this order (BASE_TARGETS depending on the
toolchainfile.cmake target) does not ensure the consistency between
the actual toolchain and the toolchainfile.cmake file, especially when
using an external toolchain.

Indeed, if you mess up configuring the external toolchain in BR, the
toolchainfile.cmake file will be generated before passing the checks;
so if the checks failed, then the toolchainfile.cmake file won't be
regenerated.

All pacth fixing this issue as be sent:
http://lists.busybox.net/pipermail/buildroot/2012-February/050405.html

BTW, i of course ack the location change of toolchainfile.cmake.

Regards,


Sam
