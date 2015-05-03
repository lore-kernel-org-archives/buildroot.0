From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 May 2015 18:26:30 +0200
Subject: [Buildroot] [PATCH] autotools-package: also handle
 pre-installed external toolchain in .la fixup
In-Reply-To: <CAD7j7Q_wnis38K8pMdDN6h=zZ6cpD5wnwdey1bExFcqMbFL8jg@mail.gmail.com>
References: <1430603450-17855-1-git-send-email-arnout@mind.be>
 <CAD7j7Q_wnis38K8pMdDN6h=zZ6cpD5wnwdey1bExFcqMbFL8jg@mail.gmail.com>
Message-ID: <55464C36.9060107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/15 18:11, Carlos Soto wrote:
> 2015-05-02 23:50 GMT+02:00 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be
> <mailto:arnout@mind.be>>:
> 
>     The .la fixup handling looks for paths starting with /usr and assumes
>     that they are missing the installation prefix (i.e. $(STAGING_DIR)). It
>     already handles the cases that $(STAGING_DIR) itself and $(BASE_DIR)
>     are under /usr, but it does not yet handle the case that a
>     pre-installed external toolchain is under /usr (and tracks that fact
>     in some .la file). For instance, if you use buildroot to generate a
>     toolchain with HOST_DIR=/usr/local/some_path, this problem will occur.
> 
>     Fix this in the same way as $(STAGING_DIR) and $(BASE_DIR), but in
>     addition check that TOOLCHAIN_EXTERNAL_INSTALL_DIR is non-empty. For
>     internal toolchains, it is empty and the sed expression would fail.
> 
>     Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be
>     <mailto:arnout@mind.be>>
>     Reported-by: Carlos Soto <csotoalonso at gmail.com <mailto:csotoalonso@gmail.com>>
>     Cc: Carlos Soto <csotoalonso at gmail.com <mailto:csotoalonso@gmail.com>>
>     ---
>     I haven't been able to test this very extensively because it's not so
>     easy to find .la files where it goes wrong.
> 
>     Carlos, can you check if this patch solves the problem for you?
> 
> 
> Hi Arnout,
> I'm afraid it does not work. I've tried patching buildroot but it gave me
> errors. So I've applied manually the changes to pkg-autotools.mk
> <http://pkg-autotools.mk> and that's what happened after a make clean && make
> find
> /home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib*
> -name "*.la" | xargs --no-run-if-empty /bin/sed -i -e
> "s:/home/starsl/iMX6/buildroot/output:@BASE_DIR@:g" -e
> "s:/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot:@STAGING_DIR@:g" 
> -e
> "s:/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g"
> -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g"  -e
> "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf:g"
> \       

 You did something wrong when manually applying the patch: there's a spurious \
at the end. At least, I think that that's the problem. Can you post the relevant
part of pkg-autotools.mk to be sure?

 Regards,
 Arnout

> /bin/sed: can't read     : No such file or directory
> make: ***
> [/home/starsl/iMX6/buildroot/output/build/alsa-lib-1.0.28/.stamp_staging_installed]
> Error 123
> 
> 
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
