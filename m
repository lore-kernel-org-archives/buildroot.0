From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2012 18:47:45 +0200
Subject: [Buildroot] [PATCH 10/13] Add update-all-config target
In-Reply-To: <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231438.17317.13801.stgit@localhost>
 <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
Message-ID: <5082D5B1.1020609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 20:45, Thomas De Schampheleire wrote:
>> +
>> >  +ctng-update-config: $(CTNG_DIR)/.config
>> >  +       $(Q)cp $<  $(CTNG_CONFIG_FILE)
>> >  +
>> >  +ifneq ($(CTNG_CONFIG_FILE),)
>> >  +UPDATE_ALL_CONFIG_TARGETS += ctng-update-config
>> >  +endif
> I would personally have split the addition of an update-config feature
> for crosstool-ng from this patch that wraps the different
> update-config targets in one update-all-config.

  Good point.


> I wonder why ctng-update-config uses a different type of recipe than
> their counterparts in busybox, uclibc, ...
>
> For busybox it is:
>> >    busybox-update-config:
>> >           cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
> while for ctng, as proposed above:
>> >  +ctng-update-config: $(CTNG_DIR)/.config
>> >  +       $(Q)cp $<  $(CTNG_CONFIG_FILE)
> Differences:
>
> - target dependency

  linux and uclibc have it, only busybox is missing it.

> - $(Q)

  My bad.

> - forced copy

  Ah, except that cp -f doesn't mean forced copy; it means: remove an
already existing file before the copy. That means that permissions are
lost and if it's a symlink, it's not the file it points to that gets
updated. So I think cp -f is _not_ what we want here...


> I would say that since all these packages are using the same kind of
> config system, the way to save their config files should also line up.
> It's possible that the new ctng-update-config is better in some ways,
> but in this case I think the other ones should be updated as well

  True, so I'll fix the use of -f in a separate patch. And add the
dependency for busybox as well.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
