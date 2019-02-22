From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 09:40:56 +0100
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming
 functionality to barebox image copy
In-Reply-To: <2748BB04F99E7E45A3203C831E8B20FE34D35E84@SERBE4I2.intra.erbe-med.de>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35E84@SERBE4I2.intra.erbe-med.de>
Message-ID: <20190222094056.5f155e17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Tue, 19 Feb 2019 11:03:52 +0000
"Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:

> >> Until now barebox images are copied to the output/images directory
> >> with their default name. This is a problem if the barebox and
> >> barebox-aux images have the same name.  
> > Could you describe a specific case/situation where this would happen ?
> > The main reason we have barebox vs. barebox-aux is because you sometimes need to build a full-blown Barebox, and a smaller Barebox that serves a first stage bootloader. From what I remember the generated images had different names, don't they ?  
> 
> In our case it's happening, because we are building a barebox to be
> used with the device normally and use the barebox-aux to build a
> barebox which we use with the serial downloader mode of our board to
> do initial setup and programming. Those images have the same name and
> the second file overwrites the first without this patch.

OK. It kind of works "by luck", because if you had been using U-Boot as
a bootloader, we don't support building two different U-Boot
configurations, and you would have had to use two separate Buildroot
configurations.

> I understand that the usual case for barebox-aux may be to build a
> first stage bootloader, but I think it should not be limited to that
> case. The description of the barebox-aux package is " Build barebox
> with an auxiliary configuration" and for this, you can't be sure that
> the image files have different names. As soon as you are building 2
> barebox images of the same type(SPL/TPL), but different config (which
> I think is quite useful) you will have this problem. I don't know if
> you may also have it in some cases when the type is different. Also,
> you can leave the setting empty and it will work just like before.
> 
> >> Also, you need to rename the images in a post-build script if you
> >> need certain file names.  
> > That is a pretty normal thing in Buildroot. We just install things
> > as they are installed by the upstream build system, and leave it up
> > to custom post-build script to further rename/move/adjust to match
> > the specific requirements of the project/user.  
> 
> I understand. In this case I see it as some kind of nice-to-have
> function you can achieve. The main reason is the one above.

Then perhaps the more Buildroot-ish way of doing things would be to
install the images build by the barebox package in a different location
than the one installed by the barebox-aux package, like
$(BINARIES_DIR)/barebox/ and $(BINARIES_DIR)/barebox-aux/. The
downsides of this are:

 - We don't do this for other packages

 - It breaks backward compatibility.

Arnout, Peter, what do you think ? (See Markus original patch for the
start of the discussion)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
