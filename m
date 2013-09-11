From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 10 Sep 2013 21:07:57 -0500
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OFF6F4B09B.A44481FD-ON86257BE3.000BB3F1-86257BE3.000BB8C3@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 
08:15:28 AM

> This commit adds support for an environment variable named
> BR2_EXTERNAL, which the user can point to a directory outside of
> Buildroot that contains root filesystem overlays, kernel configuration
> files, package recipes, defconfigs, etc. It allows users to keep their
> specific Buildroot customizations outside of the Buildroot tree.
> 
> BR2_EXTERNAL allows:
> 
>  (1) To use $(BR2_EXTERNAL) in all Buildroot configuration options
>      that take a path as argument. This allows to reference a root
>      filesystem overlay, a kernel configuration file, a Barebox
>      configuration file located in the BR2_EXTERNAL directory.
> 
>  (2) To store external package or makefile logic, since the
>      BR2_EXTERNAL/external.mk file is automatically included by the
>      Makefile logic, and the BR2_EXTERNAL/Config.in file is
>      automatically included, and appears in the top-level menu. The
>      typical usage would be to create a BR2_EXTERNAL/package/
>      directory to contain package definitions.
> 
>  (3) To store defconfig files under BR2_EXTERNAL/configs/. They will
>      be visible in 'make help' and usable through 'make
>      <someboard>_defconfig'.
> 
> In terms of implementation, it is relatively straightforward:
> 
>  * A BR2_EXTERNAL kconfig variable is added, which is set to the value
>    of the BR2_EXTERNAL environment variable.
> 
>  * The top-level Config.in file given to kconfig is no longer the main
>    Config.in in the Buildroot sources, but instead a toplevel.in file
>    generated in the output directory, which includes the top-level
>    Buildroot Config.in file and the BR2_EXTERNAL/Config.in file if
>    provided. Since is needed because the kconfig 'source' statement
>    errors out if the included file doesn't exist. I have written
>    patches that add support for an 'isource' statement in kconfig
>    (that silently ignores the inclusion if the pointed file doesn't
>    exist), but keeping feature patches against kconfig doesn't seem
>    like a good idea. Note that the "mainmenu" statement is part of
>    this generated file, because it must be the first statement seen in
>    the toplevel Config.in file passed to kconfig.
> 
>  * The BR2_EXTERNAL/external.mk makefile gets included.
> 
>  * The BR2_EXTERNAL environment variable gets passed in the
>    environment of kconfig and when executing the kconfiglib-based
>    Python script that updates the manual, so that the references to
>    the BR2_EXTERNAL variable within Config.in files can be resolved.
> 
>  * The 'make help' and 'make %_defconfig' targets are updated to take
>    into account the defconfig files stored under
>    BR2_EXTERNAL/configs/.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Ryan Barnett <rjbarnet@rockwellcollins.com>



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/c1e8074b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/c1e8074b/attachment.gif>
