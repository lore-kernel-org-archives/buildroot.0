From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 4 Jan 2014 18:52:41 +0100
Subject: [Buildroot] [PATCH 2/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <20140104174303.GC3417@free.fr>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <cfbdbd2e5437db8f56cf1db9944cc072897fbe1a.1388768519.git.yann.morin.1998@free.fr>
 <CAGduivzPoHPtq3x9se0sEpaJDGvfK7R8GM3GZ9akyMBvqzBsbw@mail.gmail.com>
 <20140104174303.GC3417@free.fr>
Message-ID: <CAGduivwZS8M=wahfeMgEgOWJwH9PpDjrRqct9Rwm7mCrXFEgSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 4, 2014 at 6:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> Thanks for the review! :-)
>
> On 2014-01-04 17:38 +0100, Maxime Hadjinlian spake thusly:
>> When doing scripting in Buildroot, do we accept the uses of various
>> bash-ism or do we want to stick to POSIX shell ?
>
> bash is already a hard-dependency of Buildroot.
>
>> On Fri, Jan 3, 2014 at 6:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
>> > diff --git a/docs/manual/customize-filesystems.txt b/docs/manual/customize-filesystems.txt
>> > new file mode 100644
>> > index 0000000..fd65c97
>> > --- /dev/null
>> > +++ b/docs/manual/customize-filesystems.txt
>> > @@ -0,0 +1,36 @@
> [--SNIP--]
>> How about comments ? Are they supported ?
>> In a next step, it would be really nice to have support for "human"
>> input for the different size, like 1G/M/K.
>
> Yes, comments are supported; I've now added that to the manual.
>
> I've also added that values can be expresed as shell arith,metic
> expansion, such as $((16*1048576)) (aka 16MiB).
>
> Not that G/M/k are SI-prefixes that respectively mean 10^9, 10^6 and
> 10^3. The binary prefixes are Gi/Mi/ki, respectively 2^30, 2^20 and
> 2^10.
>
> If/when we add support for this kind of values, we'll need to add both
> decimal and binary prefixes.
You are absolutely right. Also, it is sad, almost no one uses the
right units :(.
>
>> > diff --git a/fs/custom/boot/gpt b/fs/custom/boot/gpt
>> > new file mode 100644
>> > index 0000000..f978524
>> > --- /dev/null
>> > +++ b/fs/custom/boot/gpt
>> > @@ -0,0 +1,129 @@
> [--SNIP--]
>> > +#   Simg = 512 + 2*(Sgpt) + ?( aligned(Spart,512) )
>> Don't we want only ASCII char there ?
>
> I don't know.
>
> I find it convenient not to limit ourselves to ASCII.
I remember someone on this mailing saying something about it, don't
remember exactly what was the context.
>
> [--SNIP--]
>> > +# Sicne 4k-large sectors are not really explained on Wikipedia, we can
>> Small typo here.
>
> Thanks, fixed.
>
> [--SNIP--]
>> > +    dd if=/dev/zero of="${img}"     \
>> > +       bs=1 seek=${begin} count=0   \
>> > +       conv=sparse                  2>/dev/null
>> Why the redirect to /dev/null ? Don't we want to see if there was an
>> error ? I know it's unlikely to happen but you never know.
>> I have noticed you did several times so maybe there is a reason I am
>> not seeing here.
>
> dd will always print something to stderr, even if successful. We do not
> want it to pollute the output, since we're using nice traces.
>
> [--SNIP--]
>> > +    ret=${?}
>> > +    [ ${ret} -eq 0 ] || exit ${ret}
>> Why not doing: [ ${ret} -ne 0 ] && exit ${ret} ?
>
> Same answer as to your comment in squashfs, since we're using set -e.
>
> But here, it's a bit complex. POSIX does not specify whether a sub-shell
> that exits with a return code !0 should be caught by set -e. And bash-4.0
> does not catch it, while bash-4.2 does catch it. Both are POSIX complianti
> in this respect, since POSIX does not state what should be done in this
> case.
>
> So, we have to explicitly store the return code, and test it.
>
> But if ret==0, your test would fail, and the complete shell compound
> command " [ ... ] && ... " would also be false, and we would create an
> error that the shell would catch because of set -e, when there was no
> error to begin with.
>
> Thank you for the comments! :-)
Thanks for the explanations !
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
