From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Apr 2017 00:09:35 +0200
Subject: [Buildroot] Building multi-part rootfs images
In-Reply-To: <CA+h8R2q56gk6z_9phg_qyRccvGccQrCrF0-Sem-4+5SLqBj6dg@mail.gmail.com>
References: <CA+h8R2ofinZ+3yGzNOCtfM5KDSrxeizyEVAKTYv2v24DbEPzkw@mail.gmail.com>
 <c764d6cf-eaf1-154f-2ece-cd9bdff881fd@mind.be>
 <CA+h8R2q56gk6z_9phg_qyRccvGccQrCrF0-Sem-4+5SLqBj6dg@mail.gmail.com>
Message-ID: <e31fa965-9f62-8dac-d7ae-e30eed26bc1a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-04-17 00:05, Christian Stewart wrote:
> Hi Arnout,
> 
> On Mon, Apr 10, 2017 at 5:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Loop-mount? It should be a normal mount, no?
> 
> I said "loop mount" (forgive me if the terminology is wrong) because
> I'm still operating under a "binary blob" system where I'm not
> mounting anything r/w against the disk, so I would likely mount a loop
> filesystem (-o loop) to /lib/modules.

 Loop mount indeed means -o loop, but that's used to mount a normal file where a
block device is expected. What you want is to mount a different partition (or
UBI volume, or NFS export) on /lib/modules. At least, that's what I think you mean.

> 
>> - mounting specific subdirs. Quite easy to implement:
> 
> This seems like the most straightforward approach, especially since
> the kernel shouldn't need any modules until way later in the boot
> anyway. I can add a systemd blocking early step that does the mount.

 systemd already has that for anything specified in /etc/fstab. It's not
blocking, though.


 Regards,
 Arnout

> 
>>   - in post-build, move away the subdirs you want to mount from somewhere else
>> to a temporary directory. E.g., mv $TARGET_DIR/lib/modules $BINARIES_DIR/modules;
>>   - add a genimage.cfg that makes some filesystem out of $BINARIES_DIR/modules;
>> the same genimage.cfg can also put the rootfs.cpio and zImage somewhere where
>> the bootloader can find it;
>>   - call genimage.sh as a post-build script;
>>   - in your rootfs overlay, add /etc/fstab that mounts the filesystem.
> 
> This makes sense. I'll prototype this and report back with results.
> 
> Source code is available at http://github.com/paralin/skiffos
> 
> Thanks again!
> Christian
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
