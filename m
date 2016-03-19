From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 16:21:59 +0100
Subject: [Buildroot] [PATCH 13/16 v5] core/legal-info: generate a hash
 of all saved files
In-Reply-To: <eb5c50f958b64f8e74123763dca913bde3894bba.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <eb5c50f958b64f8e74123763dca913bde3894bba.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319162159.06219d6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 11 Mar 2016 18:49:26 +0100, Yann E. MORIN wrote:
> Having a hash of the saved files can be interesting for the recipient to
> verify the integrity of the files.
> 
> We remove the warning file earlier, to exclude it from the hash list.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

It's adding more stuff to the main Makefile (while I'd like to remove
stuff from that Makefile), for something that is quite specific. But
OK, I can see the usefulness of this hash file, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

However, I'm really surprised by this LEGAL_WARNINGS file. It's exactly
the type of hidden file (like .applied_patches) I don't like. One
example where it fails badly is if you interrupt "legal-info" in the
middle. Since the legal-warning and legal-warning-pkg macro only
concatenate to this file, then at the end of the second,
non-interrupted, make invocation, you would got some warnings from the
first run.

Why aren't we simply displaying the warnings as we go? Probably because
they were mixed with some other messages (like the messages about
download some stuff). But in this case, we can serialize the steps by
having all the download done first, then all the "aggregation" done, so
that warnings can be displayed directly without this hidden file.

Of course, this is unrelated to your change, and more a comment for
Luca.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
