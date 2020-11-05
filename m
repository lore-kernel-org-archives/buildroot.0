From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Nov 2020 17:33:49 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: fix generation of
 package list in reinstall
In-Reply-To: <20201105140401.1356161-1-unixmania@gmail.com>
References: <20201105140401.1356161-1-unixmania@gmail.com>
Message-ID: <20201105173349.76b4d206@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Thu,  5 Nov 2020 11:04:01 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Running "make <pkg>-reinstall" always shows a message like these:
> 
> comm: /.../build/pkg-x.y.z/.files-list.before: No such file or directory
> comm: /.../build/pkg-x.y.z/.files-list-staging.before: No such file or directory
> comm: /.../build/pkg-x.y.z/.files-list-host.before: No such file or directory
> 
> This happens because pkg_size_after is called in the .stamp_installed
> target and removes .files-list$(2).before, so in a second installation
> the file is not there anymore. This results in an empty .files-list.txt
> file.
> 
> Move the pkg_size_{before,after} calls from the .stamp_configured and
> .stamp_installed targets to the .stamp_{host,staging,target}_installed
> targets, respectively. This ensures that every pkg_size_after call has
> an immediately corresponding pkg_size_before call.

Unfortunately, this breaks the very reason why the .stamp_installed
step was added, as explained in the commit log for the change that
introduced this:

commit f2a12a8e9fa292ab61d99f963683a97f1283b7a3
Author: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Thu Apr 30 11:52:40 2020 +0200

    package/pkg-generic.mk: introduce final 'install' step
    
    We currently have four different install steps: target installation,
    staging installation, images installation and host installation. These
    steps are directly triggered from the $(1)-install make target, so
    there is no place where we can run some logic once all installation
    steps have completed.
    
    However, as part of improving the reliability of the logic done in
    step_pkg_size_before and step_pkg_size_after to detect the files
    installed by packages, we would in fact need to run some logic after
    all installation steps have completed. This will allow us to make sure
    that all files are detected, even if a host package installs something
    in the target directory, or if a target package installs something in
    the host directory.
    
    To achieve this, this commit implements a new stamp file,
    .stamp_installed, which is a step that depends on all four install
    steps. Currently, this step does nothing except creating the stamp
    file.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
    [yann.morin.1998 at free.fr: remove stampfile on foo-reinstall]
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

I'll try to think about the issue you've reported and see if I can come
up with some useful suggestions.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
