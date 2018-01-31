From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Jan 2018 20:50:16 +0200
Subject: [Buildroot] linux-firmware: wrong sha256 hash
In-Reply-To: <1517417554.32426.6.camel@embedded.rocks>
References: <1517417554.32426.6.camel@embedded.rocks>
Message-ID: <20180131185016.3diheii3anpqrymi@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Wed, Jan 31, 2018 at 05:52:34PM +0100, J?rg Krause wrote:
> looks like the hashes for the linux-firmware git repository have
> changed:

It seem like you were probably bitten by the --numeric-owner behaviour change 
in tar version 1.30. See the thread starting at:

  http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html

baruch

> 
> ```
> Doing shallow clone
> Cloning into 'linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b'...
> warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
> warning: Could not find remote branch 17e6288135d4500f9fe60224dce2b46d850c346b to clone.
> fatal: Remote branch 17e6288135d4500f9fe60224dce2b46d850c346b not found in upstream origin
> Shallow clone failed, falling back to doing a full clone
> Doing full clone
> Cloning into 'linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b'...
> warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
> remote: Counting objects: 6074, done.
> remote: Compressing objects: 100% (73/73), done.
> remote: Total 6074 (delta 35), reused 0 (delta 0)
> Receiving objects: 100% (6074/6074), 156.40 MiB | 5.05 MiB/s, done.
> Resolving deltas: 100% (3756/3756), done.
> Checking out files: 100% (1717/1717), done.
> warning: refname '17e6288135d4500f9fe60224dce2b46d850c346b' is ambiguous.
> Git normally never creates a ref that ends with 40 hex characters
> because it will be ignored when you just specify 40-hex. These refs
> may be created by mistake. For example,
> 
>   git checkout -b $br $(git rev-parse ...)
> 
> where "$br" is somehow empty and a 40-hex ref is created. Please
> examine these refs and maybe delete them. Turn this message off by
> running "git config advice.objectNameWarning false"
> ERROR: linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b.tar.gz has wrong sha256 hash:
> ERROR: expected: 28d359523a36c1cdc3e85a8e148bb2d68b036d28b10f0e80a192f3dc29f02c16
> ERROR: got     : bf6fe8d7620949a3e771954cb6d9d18dcf000d37ecc910a7cf69723c1798e246
> ERROR: Incomplete download, or man-in-the-middle (MITM) attac
> ```
> 
> This is also true for the non-master branches :-(
> 
> I wonder if it would help if we switch to non-git downloading the
> commit archive from the snapshot URL, e.g.:
> 
> -LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> -LINUX_FIRMWARE_SITE_METHOD = git
> +LINUX_FIRMWARE_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot
> 
> Best regards,
> J?rg Krause

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
