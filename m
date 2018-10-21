From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 21 Oct 2018 19:41:57 +0200
Subject: [Buildroot] [PATCH 3/3] cargo-bin: bump version to 0.30.0
In-Reply-To: <20181021000231.0addc2ca@windsurf.lan>
References: <20181018205835.8719-1-eric.le.bihan.dev@free.fr>
 <20181018205835.8719-4-eric.le.bihan.dev@free.fr>
 <20181021000231.0addc2ca@windsurf.lan>
Message-ID: <20181021174157.GA7056@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-10-21 00:02, Thomas Petazzoni wrote:
> Hello Eric,
>
> On Thu, 18 Oct 2018 22:58:35 +0200, Eric Le Bihan wrote:
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> I had to revert this patch, it was causing build failures due to the
> hashes. See below.
>
> > diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
> > index ad2da2bc00..96e90c6603 100644
> > --- a/package/cargo-bin/cargo-bin.hash
> > +++ b/package/cargo-bin/cargo-bin.hash
> > @@ -1,9 +1,9 @@
> > -# From https://static.rust-lang.org/dist/cargo-0.27.0-i686-unknown-linux-gnu.tar.xz.sha256
> > -sha256 64c2262c0577ef1824d3d885753362d68c04f36ea85a195894894c37e2445ef5  cargo-0.27.0-i686-unknown-linux-gnu.tar.xz
> > -# From https://static.rust-lang.org/dist/cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> > -sha256 3688bea3d971615d9c4b33612c20783bd9a385539aa7f754e6543c196e1bcec2  cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz
> > -# From https://static.rust-lang.org/dist/cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> > -sha256 d09c061daaafd735742e0b18a4da6eb656f61d4c57504d100a6ca9f766b38c71  cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz
> > +# From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
> > +sha256 4b828c263283241ad1c99f30e0b5d8554b6dac2737d09cfd466b4c15b0d7296a  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
> > +# From https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> > +sha256 3718a63fa744d9cd856d72a4fe3ac3b84ff34575a77da72667474c4726d56155  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
> > +# From https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> > +sha256 9524db722356307669c9068bb7df8dbd57e153717e62071b62560eb22ce2f3cd  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
>
> So you updated all those hashes, but they are all wrong. They not match
> the tarballs, they do not match the .sha256 files provided on the
> upstream site. The upstream site tarballs do match the .sha256 file
> that they provide, but they are different hashes than yours.

Looking at the official archive web page [1], we can see that all the
cargo-0.30.0.*.xz files have been generated on 2018-10-12T16:33, i.e.
the same day as rust-1.29.2 was released.

But my initial patch series was for rust-1.29.1 and cargo-0.30.0,
generated on 2018-10-08 [2] and cargo-0.30.0 was tagged on 2018-09-18.

So it looks like upstream did regenerate the cargo-0.30.0 tarballs for
rust-1.29.2 release.

> This looks weird and suspicious. Has upstreaming modified their tarball
> after releasing them ? Has their server been hacked, and the tarballs
> replaced with some bad thing inside ?

Void Linux seems to have the same issue [4]. They reverted a commit
where the initial hash for cargo-0.30.0-i686 was
4b828c263283241ad1c99f30e0b5d8554b6dac2737d09cfd466b4c15b0d7296a (just
like in my patch) to
43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d (the
new one). Sames goes for x86_64.

> Could you check if you still have a copy of those tarballs locally on
> your machine ? Do they have the hash that you wrote in the .hash file ?
> If so, could you carefully keep such tarballs, and compare their
> contents with the tarballs currently provided by the upstream site ?

I'll have a look.

> Note: we really don't want to blindly update those hashes so that they
> patch upstream. We need to understand why the hashes that they provide
> now don't match the ones that you provided in this patch.

Upstream offers GPG signatures so I checked the contents of the *.sha256
files to the values locally generated after checking the signatures:

```
$ gpg --keyserver-options auto-key-retrieve --verify cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.asc cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
gpg: Signature made Fri Oct 12 18:13:36 2018 CEST using RSA key ID 7B3B09DC
gpg: requesting key 7B3B09DC from hkp server keys.gnupg.net
gpg: key FA1BE5FE: public key "Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>" imported
gpg: key C46ACCF5: public key "Shukhrat Mukimov <mukimov@gmail.com>" imported
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: next trustdb check due at 2034-07-25
gpg: Total number processed: 2
gpg:               imported: 2  (RSA: 2)
gpg: Good signature from "Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 108F 6620 5EAE B0AA A8DD  5E1C 85AB 96E6 FA1B E5FE
     Subkey fingerprint: C134 66B7 E169 A085 1886  3216 5CB4 A934 7B3B 09DC
$ gpg --verify cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.asc cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
gpg: Signature made Fri Oct 12 18:16:33 2018 CEST using RSA key ID 7B3B09DC
gpg: Good signature from "Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 108F 6620 5EAE B0AA A8DD  5E1C 85AB 96E6 FA1B E5FE
     Subkey fingerprint: C134 66B7 E169 A085 1886  3216 5CB4 A934 7B3B 09DC
$ gpg --verify cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.asc cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
gpg: Signature made Fri Oct 12 18:14:44 2018 CEST using RSA key ID 7B3B09DC
gpg: Good signature from "Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 108F 6620 5EAE B0AA A8DD  5E1C 85AB 96E6 FA1B E5FE
     Subkey fingerprint: C134 66B7 E169 A085 1886  3216 5CB4 A934 7B3B 09DC
```

```
$ cat *.sha256
43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
f8d7c27a40bba6343ee7dd39a324fe772b77824921adf3e9514a44d4e49059c8  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
cb7c63c166baa42ab0be08429e29fa59fc7108efd17ca512462b2645b1655a7f  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
$ sha256sum *.xz
43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
f8d7c27a40bba6343ee7dd39a324fe772b77824921adf3e9514a44d4e49059c8  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
cb7c63c166baa42ab0be08429e29fa59fc7108efd17ca512462b2645b1655a7f  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
```

The key is listed among the official ones [5,6].

Should the new patch with proper hashes mentions something like this?

```
# From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.asc
sha256 43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
```

[1] https://static.rust-lang.org/dist/index.html
[2] https://github.com/elebihan/buildroot/commit/607827d362f8e5b073df2dc0fb5deb50fc213aaf
[3] https://github.com/rust-lang/cargo/releases/tag/0.30.0
[4] https://github.com/void-linux/void-packages/commit/65eb57a59a878483bb1678b7058f0065c42e19cd
[5] https://github.com/rust-lang-deprecated/rustup.sh/issues/65#issuecomment-242205887
[6] http://pgp.mit.edu/pks/lookup?op=vindex&search=0x85AB96E6FA1BE5FE

Regards,

--
ELB
