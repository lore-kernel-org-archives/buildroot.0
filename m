From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 22 Mar 2017 08:45:18 +0100
Subject: [Buildroot] How to organize build into multiple target
	filesystems?
In-Reply-To: <CAAXf6LXGOfQQT49B+KDdNUkbLOZzCkVtcpE7SZoN05Z65w269g@mail.gmail.com>
References: <CABKRrCWcWO3MNBnFK9fAoaYoGQBNn2eN=ZvZYovHvV1jwYQbSw@mail.gmail.com>
 <fa8d21ca-56d4-9561-bc25-333c238abfb5@mind.be>
 <CAAXf6LXGOfQQT49B+KDdNUkbLOZzCkVtcpE7SZoN05Z65w269g@mail.gmail.com>
Message-ID: <CAAXf6LXv5BOyHSGeBscxN7Ej-TfJuKcybYRVkUVbNpnK1hQuuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 21, 2017 at 9:34 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Dave,
>
> On Mon, Mar 6, 2017 at 12:52 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Dave,
>>
>>  A bit late to answer this, but perhaps still relevant.
>>
>> On 21-02-17 20:08, David Wuertele wrote:
>>> I would like my target to have a small initramfs, and a large-ish /usr
>>> filesystem mounted at runtime.  The initramfs will be populated with some of my
>>> packages, the usr fs will be populated with the rest.  I don't want the
>>> initramfs to contain anything under usr except for the /usr mountpoint
>>> directory.
>>>
>>> In general, I'm looking for a way to divert my package outputs into an
>>> arbitrary number of filesystems, which I then package in various ways,
>>> including but not limited to bundling into a kernel initramfs.
>>>
>>> Is there a way to specify such an organization in buildroot?
>>
>>  Not directly. The Buildroot Way is to keep things simple, preferably without
>> blocking real use cases. For your use case, you need specific treatment in a
>> fakeroot script.
>>
>>  Buildroot will still build a monolithic filesystem, and your fakeroot script
>> can extract parts that need special treatment. For example, you can make a
>> tarball of $TARGET_DIR/usr, then remove the /usr tree, or remove the part that
>> you don't need. You can also use $BUILD_DIR/packages-file-list.txt to find out
>> which file comes from which package, to do this on a per-package basis.
>>
>>  You will also need to add the necessary scripts (or systemd units) in a rootfs
>> overlay to stitch things back together.
>>
>>  I'm adding Thomas DS in Cc, he described a somewhat similar setup in the last
>> BR developer meeting.
>
> Sorry for the late reply.
> We are creating some opkg packages and thus extracting these files
> from the rootfs.
> The script I created for this is below. I guess it can be split in
> two: the core part and the opkg creation, as some people may just want
> tar files or something else. Feedback welcome.
>
> diff --git a/support/scripts/create-pkgs b/support/scripts/create-pkgs
> new file mode 100755
> index 0000000..8e512b2
> --- /dev/null
> +++ b/support/scripts/create-pkgs
> @@ -0,0 +1,212 @@
> +#!/usr/bin/env python
> +
> +# Copyright (C) 2016 Thomas De Schampheleire
> <thomas.de_schampheleire@nokia.com>
> +
> +import argparse
> +import collections
> +import csv
> +import os
> +import shutil
> +import subprocess
> +import sys
> +import tempfile
> +import pkgutil

On latest master this needs to become 'import brpkgutil' and
references below to pkgutil need to be changed too.

I also forgot to mention that this change depends on the following
queued patches:

http://patchwork.ozlabs.org/patch/724235/
http://patchwork.ozlabs.org/patch/724236/

/Thomas
