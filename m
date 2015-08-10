From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 10 Aug 2015 20:05:30 +0100
Subject: [Buildroot] SPARC atomic fun (and libtirpc)
In-Reply-To: <20150810184358.GX8475@waldemar-brodkorb.de>
References: <CA+BsyQ5NnVF1a3vigL7UrCcCsDpsaKtcrE1ERCQ5W5ks+8cyOQ@mail.gmail.com>
 <20150810184358.GX8475@waldemar-brodkorb.de>
Message-ID: <CA+BsyQ5cdE6HPZ4gmvye9bLaci4Wz2Fcapf0okarQPTsm_FoEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I think we need to look at the suggestion you made last week Thomas,
>> to add intelligence in configure.ac and push this to the upstream
>> packages. In the case of libtirpc I guess we should be able to detect
>> the absence of the intrinsics and, based on that, add -latomic to the
>> LDFLAGS which are exported by the pkgconfig .pc file.
>
> Hmm, I tried this, but I failed.
> It seems __sync_add_and_fetch gcc builtin is deprecated and software
> developers should use __atomic_* from gcc libatomic.
> May be we need to check for __sync_add_and_fetch and if not existent
> for the architecture, we need to use some __atomic_ function?

To be clear, I understand that the __atomic_* functions are also
builtins, but fallback versions are provided in libatomic for when the
compiler doesn't provide them or when the it can't generate a lockless
sequence.

I had been under the impression that the __sync_* functions were also
provided in libatomic but it appears that they aren't. Therefore, as
you say, it's not going to be sufficient to intelligently enable
libatomic. The packages will have to be patched to use the __atomic_*
functions instead.

>> I am happy enough to do this (it will probably be next week at this
>> stage), but I'm curious if there is much interest in trying to keep
>> SPARCv8 running. This package has been broken for 4 years and nobody
>> so far has noticed it. Are there people out there using buildroot with
>> this configuration; and if not should we talk about deprecating it ? I
>>  don't have hardware to try it on which means we need to be
>> extra-careful.
>
> You can check the results in Qemu.

Hmm .. hardware is only part of the problem. Building a test case to
prove that race conditions are definitely prevented is a bit more
tricky, and you'd have to assume that qemu would correctly emulate the
behaviour of racy code.

> Any updates on this issue?

No update, I've not had time to look at this during the past week; but
I hope to look at it shortly.

Brendan
