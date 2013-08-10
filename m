From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Aug 2013 00:54:43 +0200
Subject: [Buildroot] [RFC] BR2_DEFCONFIG not saved in defconfig,
 why? (or: can we change that?)
In-Reply-To: <CAAXf6LXJ6vkpMS2RxcakVPH8DvZeLi4Zejbnm-dLxWWeFmOXNQ@mail.gmail.com>
References: <CAAXf6LXJ6vkpMS2RxcakVPH8DvZeLi4Zejbnm-dLxWWeFmOXNQ@mail.gmail.com>
Message-ID: <5206C4B3.7040001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/07/13 11:46, Thomas De Schampheleire wrote:
> However, in my current understanding of the feature, I am forced to use
> make defconfig BR2_DEFCONFIG=configs/<name_of_defconfig>
> to set a configuration, and then
> make savedefconfig to store one.

  That is correct, except that it for config files stored in the configs 
directory it still works as before, i.e. 'make beaglebone_defconfig' 
works. If the defconfig is not in the configs directory, then obviously 
you'll have to specify it explicitly on the command line.

  The only limitation is that you have to set the path to the original 
defconfig explicitly. So you cannot do:

make defconfig BR2_DEFCONFIG=/path/to/defconfig
make menuconfig
make savedefconfig # Will not save to /path/to/defconfig

>
> To me, the command to set a configuration is overcomplicated.
> Originally it was as simple as passing the name of the config file,
> now you not only have to pass its actual path (configs/), but also you
> have to give it in a variable BR2_DEFCONFIG,*and*  use the defconfig
> rule. So, I feel better off with the original behavior.
>
> My question is: is it really needed that the value of BR2_DEFCONFIG is
> kept out of the defconfig itself? It is perfectly possible to set a
> relative path in it, or one based on a variable like TOPDIR or
> CONFIG_DIR, like so many other options already do. If someone does
> store an absolute path in it, I'd say this is the fault of the
> developer.

  In fact I agree - although it's a bad idea to base it on CONFIG_DIR 
since that's actually the output directory. Note that you would have to 
quote it if you use TOPDIR, i.e.:

make defconfig BR2_DEFCONFIG='$(TOPDIR)/boards/foo/bar/defconfig'

But actually you can even leave out the $(TOPDIR) since it's always 
relative to the buildroot directory.

  I think that I originally submitted a patch that did store the path in 
the defconfig itself, but it's possible that it just didn't work and I 
invented a reasoning for it :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
