From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 21 Jun 2018 16:32:03 -0700
Subject: [Buildroot] [RFC PATCH v4 8/9] lld: new package
In-Reply-To: <20180621144543.681def58@windsurf>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-9-joseph.kogut@gmail.com>
 <20180615230106.0bebcbb3@windsurf>
 <CAMWSM7hzA-hz5sAcpanoYQKYmX_eu-bro6zZDm0GEgDC=nNQjw@mail.gmail.com>
 <20180621144543.681def58@windsurf>
Message-ID: <CAMWSM7hCm3r8VosZRx_kyvzmTvKpGvscEF5CtDk7xb89vOtD6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 21, 2018 at 5:45 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
<snip>
> Having support for using llvm/clang/lld as a toolchain replacement was
> discussed, and it was on Valentin's radar. It would definitely be
> interesting to see some progress in this area, even though I believe it
> will be tricky as I'm sure a large number of packages will not build
> nicely with clang, the Linux kernel being an important package falling
> into this category.
>

I'm sure integrating Clang will be tricky. Even worse, GCC and Clang
are very competitive nowadays, so the utility is dubious. Furthermore,
packages such as Chromium that don't build with GCC can depend on
Clang and setup their build process accordingly, without replacing the
entire toolchain.

Even without substituting Clang for GCC, using LLVM's linker is still
interesting. The LLVM guys claim drop-in GNU compatibility and 10-20x
faster linking just by substituting LLD for GNU ld. Additionally, LLD
supports identical code folding, which can generate smaller binaries.

However, I finished testing a few builds today with LLD and a config
that includes LLVM, Qemu, libgtk3, X.org, and several other large
packages (total build time was ~45 minutes) and the difference between
GNU ld and LLD was ~6 seconds. There was no difference in generated
binary size. Maybe my build wasn't actually using LLD, I'll have to do
some more testing.
