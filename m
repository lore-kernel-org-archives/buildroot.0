From: Lionel Flandrin <lionel@svkt.org>
Date: Fri, 27 Jan 2017 10:52:51 +0100
Subject: [Buildroot] [PATCH 1/3] mkpimage: rewrite to support header
 version 1
In-Reply-To: <20170127211703.7e7d1113@free-electrons.com>
References: <20170126112516.h465tdgnpl4ixh3f@ed>
 <20170126112831.28107-1-lionel@svkt.org>
 <20170127211703.7e7d1113@free-electrons.com>
Message-ID: <20170127095249.d74pnbgc32fhp7do@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 27, 2017 at 09:17:03PM +1300, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 26 Jan 2017 12:28:31 +0100, Lionel Flandrin wrote:
> > mkpimage is a proprietary tool part of Altera's Embedded Development
> > Suite which is used to generate the image files supported by their
> > BootROMs.
> > 
> > Newer versions of their SoCs (such as the Arria 10) use header version
> > 1 which was not supported by the previous version of this tool.
> > 
> > This new version supports header version 1, improves error handling
> > and tweaks the output to bring it closer to Altera's own tool. In
> > particular the padding calculations have been changed. In all the
> > configurations tested this program and Altera's mkpimage produce
> > exactly the same files (while the previous version didn't).
> > 
> > Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> 
> Why not import the new version of this program available in Barebox,
> which does support V1 headers nowadays?

Because I only noticed that too late... The comment about the barebox
version was in the mk and when I saw it I was almost already done with
my version. My search engine skills failed me once again.

Furthermore this version supports some additional parameters like
setting the alignment and the entry point offset in the header (which
are also supported in Altera's tool). It's also a little more user
friendly (better error reporting etc...). Not a huge deal but still.

More importantly it's closer to Altera's original mkpimage, both in
command line usage and in the resulting image format making it a
better canditate for drop-in replacement. So I decided that it was
worth finishing it.

> Otherwise, where does your version comes from?

It's original work based on the current version of mkpimage.c in the
buildroot repo and my reverse-engineering of version 16.1 of Altera's
closed source java-based mkpimage.

I realize it might make it a bit "off-topic" for inclusion in source
form in buildroot's repo but it's not exactly complicated code either,
it's a simple 14byte header and a 32bit CRC.

I've compared the output of this code with altera's and barebox's
version and they all generate the same binaries with the caveat that
barebox's version uses different alignment constraints and doesn't
handle certain options.

But really it's up to you, for my current use case I can live with
barebox's updated version if you prefer. Alternatively I could try
getting this version of the code in barebox first, even though I don't
use the project myself.

> Best regards,
> 
> Thomas

Thank you for taking the time to review this,
-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170127/ae7fd5f0/attachment.asc>
