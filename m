From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 7 Oct 2013 10:19:40 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
Message-ID: <CAAXf6LVxoXMaBFVzc6Hd46ST8AwDOyd8PdRfJ04WKfF9po_K9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, all,

Let's try to summarize/conclude on these items...

On Wed, Oct 2, 2013 at 4:06 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
> I am starting to use the legal-info infrastructure now, and this
> resulted in a number of observations/problems, which I'll list below.
>
> 1. there is no longer a provision to 'hide' proprietary packages from
> the manifest, and not get warnings on them. Previously you could mark
> a package as license: PROPRIETARY, but this has been removed. I still
> think that a similar feature is useful.

Since Luca is not in favor of keeping a magic value like PROPRIETARY,
I'm ok with his suggestion of FOO_SAVE_LEGAL_INFO = YES/NO combined
with FOO_REDISTRIBUTE = YES/NO:

-----
option 3, a mix the other two:
  FOO_SAVE_LEGAL_INFO = {YES|NO}, default YES
  FOO_REDISTRIBUTE= {YES|NO}, default $(FOO_SAVE_LEGAL_INFO)

Meaning:
 * by default FOO_SAVE_LEGAL_INFO rules it all, and we do the same thing
   for manifest+licenses.txt and source tarball copying (save all or
   save nothing);
 * the two can be forced to behave differently by defining
   FOO_REDISTRIBUTE with a value opposite to FOO_SAVE_LEGAL_INFO.

----

If others are too, then we can move forward with implementing it.

>
> 2. suppose FOO_LICENSE_FILES = subdir/COPYING, then the manifest also
> contains the string 'subdir/COPYING'. However, the license is copied
> into a flat structure output/legal-info/licenses/foo/, so I think that
> the manifest should no longer mention the 'subdir'.
> Of course, this may contradict with the needs of licenses.txt (the
> flat representation of all licenses) that does not suffer from the
> subdir problem.
>
> 3. partially related to point 2: if a package has multiple license
> files with the same name but in subdirectories, e.g. a/COPYING and
> b/COPYING, the copying of the license will copy both files on top of
> each other. This is the case for xenomai-forge (not yet in buildroot),
> which is the new strategy for xenomai [1]. I have brought up this
> issue with the developers [2], but maybe there is something else we
> can do.
>
> [1] http://git.xenomai.org/?p=xenomai-forge.git;a=summary
> [2] http://www.xenomai.org/pipermail/xenomai/2013-October/029262.html

Both points have been addressed properly with Peter's patch.

>
> 4. Suppose that a package has no license files and explicitly declares
> this with FOO_LICENSE_FILES =
> In this case, you will still get a warning: "cannot save license
> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
> I think it would be better to distinghuish the situation 'empty' and
> 'not defined'.

Reading the various comments I have the impression there is a
consensus to define a magic value for FOO_LICENSE_FILES, correct. The
question is: which value(s). If we want to differentiate between:
a. there is a license, it has a license text, but the text is not
provided with the sources, and
b. there is a license but there doesn't exist any license text,
then we need two magic values.

There were a few suggestions:
N/A, none, NONE (ThomasP), which would cover (b)
missing (rejected by ThomasP), not-provided, none-provided (ThomasDS),
which would cover (a)


In case of (a), I'm not sure if a warning is needed. It could for
example be that the license is 'public domain' which doesn't need a
license text.
For (b) I think a warning is a good idea.



Related to this is the question of a license URL. I personally think
it is not legally safe to only refer to a URL from a package, because
who knows someone changes the license text on the URL. They could just
alter the license of existing sources.
So although the feature of automatically downloading a license text
from its URL looks nice, I (not a lawyer) would not recommend
implementing it. I follow ThomasP's reasoning of requesting upstream
to add the effective license text to the sources, and in the meantime
using the magic value decided above for case (b).

>
> 5. the manifest also lists all host packages, like automake, autoconf,
> ... while these are not distributed on target. Strictly speaking you
> do not have to list these in the customer documentation of a product,
> in my interpretation. I find it confusing that both target and host
> packages are mixed like that.
> Of course, it's probably difficult to change this, because some
> packages can be built for host _and_ target, and the legal-info
> infrastructure does not know which of these was used for a particular
> project.
>

This point has been addressed by my patches that split the legal info
output between host/target.

Best regards,
Thomas
