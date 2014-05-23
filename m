From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 23 May 2014 11:33:42 +0200
Subject: [Buildroot] RPi
In-Reply-To: <731900685.15108515.1400742119060.JavaMail.root@openwide.fr>
References: <20140521180435.GA3556@free.fr>
 <731900685.15108515.1400742119060.JavaMail.root@openwide.fr>
Message-ID: <CAM+bi4tmfmDtqcQeo6yxFwTzFEwopjkZkHS6+h3DM2CswzmJTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Pierre, all

I just happen to be (trying) to build an image for a raspberry PI and
I'm running into a hell of problems due to the really not so good
quality of these devices.

This said, I've just run your script to see if it helps with my own
problems and I've got a few remarks:

* The write way to call the script is by passing output/images as
parameter. This should either be the default or at least documented. I
guessed it by reading the error messages when I didn't pass any
parameter

* I just passed your script a wrong path and instead of aborting on
the first error, it continued to try to do its thing. It should end as
soon as an error is detected.

* parted is usually located at /sbin, so you must provide full path in
your script if you don't intend to run it as root.

* ditto with mkfs

* mkfs.fat: warning - lowercase labels might not work properly with
DOS or Windows
I guess this can be avoided

* It tries to search for some files that are not provided in the path you wrote:
cp: cannot stat 'output/images//../../board/raspberrypi/cmdline.txt':
No such file or directory

* You leave a 1.3x extra space for the ext2 partition and define the
partition this long. However, the filesystem doesn't know about this
extra space. You should use resize2fs to let the filesystem expand to
fill the whole partition.

* Final message should include the real output directory of the image:
You just have to do 'dd if=rpi-sdcard.img of=<SD card device>'
wouldn't work because the file is located at output/images/rpi-sdcard.img

* And last but not least, my Raspberry PI wasn't able to boot from the
sdcard flashed with the resulting image. However, I wouldn't say this
is your scripts' fault because I almost sure my raspberry PI is
basically broken, for it only boots with a very specific image/sdcard,
I'm yet to fully diagnose it. However, it would have been nice if your
script had booted in my subpar PI.

Kind regards,


2014-05-22 9:01 GMT+02:00 Pierre Ficheux <pierre.ficheux@openwide.fr>:
> Hi,
>
> The script doesn't need to bee root. It creates SD image from VFAT + EXT3 partitions created by Buildroot (see attached)
>
> I think it's a good way to start BR on RPi, quite simple.
>
> regards
>
> ----- Mail original -----
>> De: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ?: "Pierre Ficheux" <pierre.ficheux@openwide.fr>
>> Cc: "buildroot" <buildroot@busybox.net>
>> Envoy?: Mercredi 21 Mai 2014 20:04:35
>> Objet: Re: [Buildroot] RPi
>>
>> Pierre, All,
>>
>> (He! The same usual suspects! ;-) )
>>
>> On 2014-05-21 14:05 +0200, Pierre Ficheux spake thusly:
>> > I did some work on BR around Raspberry Pi platform:
>> >
>> > - adding a post-image script for RP SD-card image generation
>> > (adapted
>> > from Yocto RPi recipe)
>> > - adding BR support for Adafruit touchscreen ->
>> > https://www.adafruit.com/products/1601
>> >
>> > I don't know if it could help, but I can build patches.
>>
>> For the RPi script, I have to admit I'm a bit sceptic. We usually
>> document, as much as we can, the preparation of media for the boards
>> (you can see the one for the RPi in boards/raspberrypi/readme) but we
>> usually do not provide such scripts.
>>
>> The only board we're currently doing it for, is the cubieboard, and
>> it
>> IMHO has quite a few shortcomings:
>>   - requires being root
>>   - uses host-tools without enabling them in the defconfig
>>   - makes some heavy assumptions on the layout (generated files and
>>     medium)
>>   - does not handle all failure modes
>>   - is (a bit) convoluted
>>
>> Also, I'm a bit warry at providing such a root-requiring script, as
>> it
>> is so easy to bork things on an unsuspecting user's machine. I for
>> one
>> would not run such a script to begin with.
>>
>> I highly prefer we provide a good documentation on how to generate
>> basic
>> media for a board, and redirect the user to the upstream
>> documentation
>> (if it exists.)
>>
>> We've tried to have a generic infrastructure that would generate
>> images
>> for any board, without any hard-coded layout or the likes), but it
>> turns
>> to not be so easy. Such an infra would have to cover all comon cases,
>> but also weird corner-cases, where the layout is not simply a
>> collection
>> of partitions laid out on some media (think initramfs with part of
>> the
>> VFS mounted from a block device, it's not easy.)
>>
>> Others may disagree on the above, so please provide your script, so
>> we
>> can see and decide on actual code. ;-)
>>
>> As for the touchscreen support, that would be very interesting,
>> indeed!
>> Please send your patch! :-)
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> |  conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>> |               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/
>> |  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>> |   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>>
>
> --
> Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
>                                          http://ingenierie.openwide.fr
>                                          http://www.linuxembedded.fr
> I would love to change the world, but they won't give me the source code
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
?lvaro G?mez Machado
