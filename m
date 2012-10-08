From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 08 Oct 2012 09:43:24 +0200
Subject: [Buildroot] [PATCH] linux: Fix initramfs compression
In-Reply-To: <5071E475.5070908@gmail.com>
References: <1349551332-25169-1-git-send-email-gvaxon@gmail.com>
 <50716829.7010004@mind.be> <5071E475.5070908@gmail.com>
Message-ID: <5072841C.7010505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/12 22:22, Valentine Barshak wrote:
> The problem here is that we can't set initramfs compression mode unless the initramfs source (CONFIG_INITRAMFS_SOURCE)
> is set. We can only set RAM disk compression modes that should be supported by the kernel (CONFIR_RD_...).
>
> The source is set by buildroot. So the user has no capability to configure compression explicitly, unless he (she) sets
> a fake initramfs source file, which will be overridden by buildroot. IMHO, this is a bit hackish way to set anything
> other than default, which is COMPRESSION_NONE.
>
> Yes, that is what most people want. I just didn't want to drop other options in case somebody wants a compressed
> initramfs image.
> This could be needed for systems with low memory, for example.

  True.  Still, I don't think that this corner case warrants the additional
complexity of grepping etc. in the buildroot makefile.  Especially because it
still doesn't give the user complete configuration freedom: if both GZIP and
BZIP2 initrd compression options are enabled (like is the case in some of the
kernel's defconfigs), then still GZIP will be chosen.

  If we really want to support this in buildroot, then the choice should be added
to fs/initramfs/Config.in.  But also here I doubt that the (maintenance) work of
having this option is worth it, because it's likely that it will _never_ be used.

  As you say yourself, if you really do need the option, there is a possibility
to do it.  And it's not as bad as you say, because when you run
'make linux-menuconfig', buildroot will first run a 'linux-configure' so the
INITRAMFS_SOURCE will already be set.  (At least, I think so :-)


  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
