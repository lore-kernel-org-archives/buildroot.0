From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2013 07:58:31 +0100
Subject: [Buildroot] Name of downloaded archive, conflicts
In-Reply-To: <20131025160524.4f8e922a@pcviktorin.fit.vutbr.cz>
References: <20131025160524.4f8e922a@pcviktorin.fit.vutbr.cz>
Message-ID: <526E0B17.8020402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/13 16:05, Jan Viktorin wrote:
> Hello,
>
> I have encountred a problem when downloading custom kernel together
> with a custom (e.g.) u-boot. Both are downloaded from GitHub from a
> master branch. The URLs are (in case of using master branches):
>
>   https://github.com/Xilinx/u-boot-xlnx/archive/master.tar.gz
>   https://github.com/Xilinx/linux-xlnx/archive/master.tar.gz
>
> and that leads to a file name conflict in the dl/ directory. I end
> with linux kernel extracted in the u-boot build directory...
>
> Is there a way in buildroot how to specify a different name after
> download is done or another way how to avoid the conflict? I tried to
> google a bit, however, without a success.

  This is a known issue, and we don't have a good solution for it.

  We have considered prepending the package name to every archive that is 
downloaded, but this has two important problems:

  1. You can't use the download directory as a BR2_PRIMARY_SITE anymore.

  2. If the same source is used by two packages (e.g. kernel-headers and 
linux), then it will also be downloaded twice.

  We haven't found a good solution for these problems. Ideas are welcome, 
though.


  Fortunately, for your use case, there's an easy solution. Don't use 
'master', but instead use an explicit sha1 of the version you want to 
download. Your .config should really be reproducible, so that you can 
give it to a colleague and they'll build the _same_ kernel as you.

  While you're developing linux and/or U-Boot, you can use the 
_OVERRIDE_SRCDIR mechanism (which admittedly isn't very well documented 
at the moment), which is a more explicit way of making 'local' changes to 
the .config.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
