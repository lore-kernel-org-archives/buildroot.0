From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 16 Feb 2017 11:24:47 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <20170216094006.2af7df62@free-electrons.com>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <CAAXf6LXLKBVDDoU6QcqspBnaQm2-wrWtP50Ot5knU0=oLwz62w@mail.gmail.com>
 <20170216094006.2af7df62@free-electrons.com>
Message-ID: <CAAXf6LV=CtKJv+oE_VJdXRQpKPZVdYyXBAGJtyujf7VAce1VcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Feb 16, 2017 09:40, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Thu, 16 Feb 2017 09:36:28 +0100, Thomas De Schampheleire wrote:

> > Since there is already the exact same pattern for XZCAT, I decided to
> > apply your patch anyway. I also don't really understand the use case
> > for all those BR2_ZCAT, BR2_BZCAT, BR2_XZCAT, etc. config options.
> > Peter, maybe you can shed some light on why we have these?
>
> The background for the xzcat case is **drumroll** old RHEL machines
> which do not have xz.
> If the host does have xzcat, then the definition of XZCAT from the
> config is used.
> If the host does NOT have xzcat, then buildroot is instructed to build
> it for us, as a host package, and the result will be set in
> $(HOST_DIR)/usr/bin/. This is the reason for the 'hardcoded' path. In
> this scenario, the variable XZCAT from Makefile does not point to
> something valid.

Thanks for the reminder, but I believe I already knew all of this, and
it's not really the point of my concern/question.

> The reason why in general we have config options for some tools like
> git, zcat, etc. is to let the user decide what they should be. This is
> not only to be able to add certain options, but also because the user
> may want to point to a differently named tool with the same behavior.

Right but the various BR2_{GZIP,XZCAT,LZCAT,...} options also encode
options passed to these programs, not only the path to them. If it was
just the path to them, I wouldn't have a problem at all with this being
ignored if Buildroot builds its own host-xz or host-lzip.


I agree that there is a inconsistency. I think the ways to cover it is
either to split the config option in two: one for the path and one for
options, or use firstword to split ourselves.
However, in the case that a user specified a custom tool, then the options
may not be relevant for a buildroot-built version. For example: if I make a
'my-super-extractor' that handles all archive types, and I set this one in
the config options like 'my-super-extractor --xz', 'my-super-extractor
--gz' etc, then these options '--gz' etc will not work on the
buildroot-built 'standard' tool.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170216/e284f28a/attachment.html>
