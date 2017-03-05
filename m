From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 00:52:46 +0100
Subject: [Buildroot] How to organize build into multiple target
 filesystems?
In-Reply-To: <CABKRrCWcWO3MNBnFK9fAoaYoGQBNn2eN=ZvZYovHvV1jwYQbSw@mail.gmail.com>
References: <CABKRrCWcWO3MNBnFK9fAoaYoGQBNn2eN=ZvZYovHvV1jwYQbSw@mail.gmail.com>
Message-ID: <fa8d21ca-56d4-9561-bc25-333c238abfb5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Dave,

 A bit late to answer this, but perhaps still relevant.

On 21-02-17 20:08, David Wuertele wrote:
> I would like my target to have a small initramfs, and a large-ish /usr
> filesystem mounted at runtime.  The initramfs will be populated with some of my
> packages, the usr fs will be populated with the rest.  I don't want the
> initramfs to contain anything under usr except for the /usr mountpoint
> directory.
> 
> In general, I'm looking for a way to divert my package outputs into an
> arbitrary number of filesystems, which I then package in various ways,
> including but not limited to bundling into a kernel initramfs.
> 
> Is there a way to specify such an organization in buildroot?

 Not directly. The Buildroot Way is to keep things simple, preferably without
blocking real use cases. For your use case, you need specific treatment in a
fakeroot script.

 Buildroot will still build a monolithic filesystem, and your fakeroot script
can extract parts that need special treatment. For example, you can make a
tarball of $TARGET_DIR/usr, then remove the /usr tree, or remove the part that
you don't need. You can also use $BUILD_DIR/packages-file-list.txt to find out
which file comes from which package, to do this on a per-package basis.

 You will also need to add the necessary scripts (or systemd units) in a rootfs
overlay to stitch things back together.

 I'm adding Thomas DS in Cc, he described a somewhat similar setup in the last
BR developer meeting.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
