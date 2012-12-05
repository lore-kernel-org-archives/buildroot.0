From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 18:14:24 +0100
Subject: [Buildroot] How to handle modularity in buildroot?
In-Reply-To: <CAE21AQp9tsnrS=uR0BoOuYi15Vew=swx24FapMC7Fyi+W0E3+A@mail.gmail.com>
References: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
 <F9C551623D2CBB4C9488801D14F864C610B824F7@ex-mb1.corp.adtran.com>
 <201212041249.14541.manningc2@actrix.gen.nz> <20121204101042.3ae057bb@skate>
 <CAE21AQp9tsnrS=uR0BoOuYi15Vew=swx24FapMC7Fyi+W0E3+A@mail.gmail.com>
Message-ID: <50BF80F0.8050603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/12 19:18, Charles Manning wrote:
>> >  And then, when you want to do a production build:
>> >
>> >    make clean
>> >    cat mysystem_base_defconfig.frag mysystem_prod_defconfig.frag>  configs/mysystem_prod_defconfig
>> >    make mysystem_prod_defconfig
>> >    make
>> >
>> >  And when you want to do a development build:
>> >
>> >    make clean
>> >    cat mysystem_base_defconfig.frag mysystem_dev_defconfig.frag>  configs/mysystem_dev_defconfig
>> >    make mysystem_dev_defconfig
>> >    make
>> >
>> >  Basically, instead of having Buildroot providing this feature, we rely
>> >  on the simple manipulation of the configuration file.
> This sounds like the right idea.
>
> I will experiment with this a bit and see where it takes me. If there
> is something worth sharing I'll do that.

  If you don't want to clobber your buildroot tree with
configs/mysystem_dev_defconfig, you can instead do:

  make clean
  cat mysystem_base_defconfig.frag mysystem_dev_defconfig.frag > /tmp/mysystem_dev_defconfig
  make defconfig BR2_DEFCONFIG=/tmp/mysystem_dev_defconfig
  make


  And to create the _dev fragment, you can try something like:

make savedefconfig
sort defconfig mysystem_base_defconfig.frag | uniq -u > mysystem_dev_defconfig.frag

(this is just from the top of my head so YMMV).


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
