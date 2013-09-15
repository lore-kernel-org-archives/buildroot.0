From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 15 Sep 2013 14:37:21 -0400
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <20130915200014.5543b2a1@skate>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
Message-ID: <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Sep 15, 2013 at 2:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> +config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
>> +     bool "Use custom config file"
>> +     help
>> +       Select to use a custom volume configuration file.  Otherwise,
>> +       a configuration file will be generated automatically.
>
> I'd like to have a bit more documentation here, and especially
> explicitly mention that we're talking about the configuration file
> passed to the 'ubinize' tool. Also, I'm not sure the name 'volume
> configuration file' is correct: the ubinize configuration file does not
> describe the configuration of one volume, but rather the configuration
> of all volumes that will be contained in an UBI "space".
>
> Some maybe something:
>
>         Select this option to use a custom ubinize configuration file,
>         rather than the default configuration used by Buildroot (which
>         consists in generating an UBI image that contains a single
>         volume, itself containing the root filesystem). Passing a
>         custom ubinize configuration file will allow you to create
>         several volumes.
>
> However, I'd like to add more detail on using the rootfs UBIFS image in
> a volume (i.e $@fs in the existing code), but I'm not sure what
> suggestion to give to the user: i.e, what image= line should he put in
> his custom configuration file?

What I found was that the image path is relative to the $(TOPDIR).  So
if you are providing your own file, you need to know your $(O) and
either specify a path relative to $(TOPDIR), or an absolute path.  i
played with the idea of having a sed line or something to substitute
in a file path, but decided against.  I though that if you are
providing your own config file, then it could refer to multiple images
in different output directories (for whatever reason), in which case
you have to know where your files are anyway.

Maybe the description needs something like:


>> +config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
>> +     string "Configuration file path"
>> +     depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
>> +     help
>> +       Path to the volume configuration file
>
> Path to the ubinize configuration file.

Okay.


>> +ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
>> +UBI_UBINIZE_PREP_CFG = \
>> +     cp $(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE) ./ubinize.cfg
>> +else
>> +UBI_UBINIZE_PREP_CFG = \
>> +     cp fs/ubifs/ubinize.cfg . ; echo "image=$@fs" >> ./ubinize.cfg
>> +endif
>> +
>>  define ROOTFS_UBI_CMD
>> -     cp fs/ubifs/ubinize.cfg . ;\
>
> Am I looking wrong, or are we copying ubinize.cfg to the root of the
> Buildroot source tree? If that's the case, then it's really really
> wrong, as the source tree should be read-only. Instead, we should copy
> it to some location in $(O).

Correct - that's the way it was, so I didn't change it.  But it would
be easy to change "./ubinize.cfg" to "$(O)/ubinize.cfg".  I'll do
that.
