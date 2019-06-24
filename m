From: John Keeping <john@metanate.com>
Date: Mon, 24 Jun 2019 12:30:27 +0100
Subject: [Buildroot] [RFC PATCH] download/git: ban branch references
In-Reply-To: <20190622074713.GB13664@scaer>
References: <20190619151817.6331-1-john@metanate.com>
 <20190619163420.1a46c7eb@donbot> <20190620163946.GJ2216@scaer>
 <20190621173653.3e3c2d89@donbot> <20190622074713.GB13664@scaer>
Message-ID: <20190624123027.485c128f@donbot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, 22 Jun 2019 09:47:13 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2019-06-21 17:36 +0100, John Keeping spake thusly:
> > We can then filter out non-tags with:
> >     case $(git rev-parse --symbolic-full-name "${cset}") in  
> 
> Need for 2>/dev/null or there is a big warning printed (see below).

Agreed, although see below for that specific case.

> >         refs/tags/*
> >             : ok
> >             ;;
> >         refs/*
> >             printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
> >             ;;
> >         # Anything else is not a ref, must be a raw hash which is ok.  
> 
> That's wrong, because branches may pre-exist from git-clones that we do
> currently.
> 
> For example, I have a local git clone of linux-firmware, which has:
> 
>     $ git branch
>     * 1baa34868b2c0a004dc595b20678145e3fff83e7
>       44d4fca9922a252a0bd81f6307bcc072a78da54a
>       d87753369b82c5f362250c197d04a1e1ef5bf698
> 
>     $ git rev-parse --symbolic-full-name 1baa34868b2c0a004dc595b20678145e3fff83e7
>     warning: refname '1baa34868b2c0a004dc595b20678145e3fff83e7' is ambiguous.
>     Git normally never creates a ref that ends with 40 hex characters
>     because it will be ignored when you just specify 40-hex. These refs
>     may be created by mistake. For example,
> 
>       git checkout -b $br $(git rev-parse ...)
> 
>     where "$br" is somehow empty and a 40-hex ref is created. Please
>     examine these refs and maybe delete them. Turn this message off by
>     running "git config advice.objectNameWarning false"
>     refs/heads/1baa34868b2c0a004dc595b20678145e3fff83e7
> 
>     $ git rev-parse --symbolic-full-name 1baa34868b2c0a004dc595b20678145e3fff83e7 2>/dev/null
>     refs/heads/1baa34868b2c0a004dc595b20678145e3fff83e7
> 
> So, 1baa34868b2c0a004dc595b20678145e3fff83e7 is the sha1 we curently use
> in Buildroot, the two others we used in the past.
> 
> So, your code snippet above woud break the build. We have a single
> option, really, which is to try and remove the local branch before
> checking if the cset is a branch.

Note that the suggestion earlier in my message to change the fetch
mechanism avoids this problem by ensuring that these branches do not
exist.  It turns out to be slightly more complicated than just doing:

	git fetch origin --prune +refs/*:refs/*

but that can be made to work and means that we avoid the whole problem
of unexpected refs.

I'll send updated patches in reply to this message.


Regards,
John
