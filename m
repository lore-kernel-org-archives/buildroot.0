From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jan 2013 16:01:33 +0100
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
Message-ID: <20130117160133.61661524@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aras Vaichas,

On Thu, 17 Jan 2013 14:47:47 +0000, Aras Vaichas wrote:

> I am configuring Buildroot to use an OMAP-L138/DaVinci CPU. I'd like
> to use the Linux kernel version from
> http://gitorious.org/linux-davinci/linux-davinci/trees/v3.7-davinci1
> which is a specific tag in the git repository.
> 
> In Buildroot I set:
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1
> 
> The file that is returned has the name "v3.7-davinci1", and it is a
> "gzip compressed data, from Unix" according to file.
> 
> Gitorious calls it a "tarball" but it's obviously not a tarball.

It most likely is. When a tarball is gzipped compressed, "file" only
reports it as a gzipped compressed file, it doesn't know there is a
tarball inside.

> Unfortunately Buildroot fails because, understandably, the file isn't
> a tar archive.
> 
> >>> linux custom Extracting
> /opt/br/dl/v3.7-davinci1 | tar --strip-components=1 -C
> /opt/br/output/build/linux-custom  -xf -
> /bin/bash: /opt/br/dl/v3.7-davinci1: Permission denied
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> 
> Should I add an option to Buildroot to handle gzipped files? Or is
> there a better way?

The problem here is that since the filename doesn't end with .tar.gz,
Buildroot doesn't know which extraction method to apply, and therefore
doesn't apply any, which leads Buildroot to try to execute your tarball.

Hum, I am not sure how to handle that. Should we try to extract simply
with tar something that does not have an extension?

Github sends a correct filename in the Content-Disposition header of
the HTTP reply, and wget --content-disposition is supposed to name the
output file according to this filename given in the HTTP reply, but it
doesn't work for me... and anyway, Buildroot would have no way to know
what is the new name of the file.

I don't have a lot of ideas for now, unfortunately :-(

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
