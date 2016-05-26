From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 May 2016 23:08:34 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <8737p460v7.fsf@dell.be.48ers.dk>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <87bn3s61en.fsf@dell.be.48ers.dk>
 <20160526215929.61993c8f@free-electrons.com>
 <8737p460v7.fsf@dell.be.48ers.dk>
Message-ID: <20160526210834.GA3606@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-05-26 22:05 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Thu, 26 May 2016 21:54:08 +0200, Peter Korsgaard wrote:
> 
>  >> Can dd detect and do something sensible about sparse files? I thought it
>  >> was only able to create sparse files (by seeking)? I would guess you
>  >> need a tool that understand the filesystem to know if you can really
>  >> skip sequences of zeros when writing.
> 
>  > man dd(1):
> 
>  >        sparse try to seek rather than write the output for NUL input blocks
> 
>  > So it doesn't seem to need a sparse file, it's just that it detects
>  > blocks that are completely zero and does not write them.
> 
> Yes, but you cannot safely use that. What if you have a file on your
> filesystem containing a block of zeroes? (or as part of the filesystem
> meta data like block bitmap or journal) You need to make sure that does
> get written to the card, otherwise you will read back whatever was
> written before to the card.

For the record, I was using the sparse option to dd in the past, and it
was causing a hell of a lot of filesystem corruption at runtime:
ext2/3/4 especially would cause the kernel to PANIC at best, or would
cause massive data corruption at worse.

So no, you can not use sparse when dd-ing or otherwise flashing) your
images to the target.

Beside, we explicitly state so in the manual:

    https://buildroot.org/downloads/manual/manual.html#_dealing_efficiently_with_filesystem_images

    Note however that flashing a filesystem image to a device while using
    the sparse mode of dd may result in a broken filesystem (e.g. the block
    bitmap of an ext2 filesystem may be corrupted; or, if you have sparse
    files in your filesystem, those parts may not be all-zeroes when read
    back). You should only use sparse files when handling files on the build
    machine, not when transferring them to an actual device that will be
    used on the target.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
