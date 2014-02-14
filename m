From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 14 Feb 2014 21:39:36 +0100
Subject: [Buildroot] Open bug analysis
In-Reply-To: <20140213195254.0b17b5bf@skate>
References: <CAAXf6LUmkkW8RxfC8RjYTYRnFDJ+TbNOiKM+LyMBDHJu37ORZA@mail.gmail.com>
 <20140213195254.0b17b5bf@skate>
Message-ID: <CAAXf6LVJwg4Xcjg1rMZvfgC8xi-9TJrV7faUknff630duLG_AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your feedback...

On Thu, Feb 13, 2014 at 7:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 13 Feb 2014 16:30:37 +0100, Thomas De Schampheleire wrote:
>
>> Doing a Buildroot build from /usr doesn't work
>> https://bugs.busybox.net/show_bug.cgi?id=5750
>> ThomasP, you are assigned to this bug. Have you done an analysis about
>> this in the past? What are the reasons for these problems?
>
> The main problem I had identified was our logic to fixup the .la files.
> To fix it, I had written:
>
> -               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
> +               $$(SED) "\:['= ]$(STAGING_DIR)/usr:!s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
>
> but I believe it still wasn't working properly, because the staging
> directory was being re-prefixed everytime this was executed on all .la
> files. But I may not necessarily remember all the details.

I am trying to reproduce and fix this.
As mentioned on IRC, I'm currently using a slightly modified version
of the above .la fixing:

-               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
+               $$(SED) "s:\(['=
]\)/usr/lib:\\1$(STAGING_DIR)/usr/lib:g" $$$$i; \
+               $$(SED) "s:\(['=
]\)/usr/local/lib:\\1$(STAGING_DIR)/usr/local/lib:g" $$$$i; \

I.e. instead of searching for /usr/something, only search for /usr/lib
as this is where all .la files are put.
I actually don't think we need the /usr/local/lib line.

I'm testing this with a randconfig, and it's been busy for a while
without any problem yet. I have good hopes.
It actually moves the problem, but I think that it is more acceptable
of not supporting buildroot inside /usr/lib then not supporting
buildroot in /usr entirely...

>
>> binutils-2.23.2/gas fails with undefined reference to `mbstowcs'
>> https://bugs.busybox.net/show_bug.cgi?id=6218
>> The submitter did not respond to questions from ThomasP. The bug
>> report hardly contains any info.
>> I tried building an internal toolchain for arm7tdmi, using
>> binutils-2.23.2, and binutils built fine.
>> My proposal is to close this bug to Resolved/Worksforme.
>
> I agree with this proposal.
>
>> binutils-2.23.2/bfd fails with undefined reference to __fini_array_end
>> https://bugs.busybox.net/show_bug.cgi?id=6236
>> Same submitter as last patch, but about 10 days later. Logically, if
>> the first problem is reproducible, one couldn't get a second problem
>> unless the first one is fixed... So I have my doubts about this. As
>> said above, I tried building binutils in this configuration (with and
>> without MMU support) and this succeeded.

Thanks, bugs closed.

>>
>>
>> Cannot compile gcc without threads (uClibc-based)
>> https://bugs.busybox.net/show_bug.cgi?id=6230
>> I tried reproducing this problem, and the build indeed fails, but even
>> with the proposed modified uclibc config file. So my conclusion is
>> that this is a real bug that we need to look at.
>
> Then it should be investigated a bit more :)

True :)

>
>> Support for kernel signed modules
>> https://bugs.busybox.net/show_bug.cgi?id=6764
>> This bug report has a patch attached, and both Yann and me asked the
>> submitter to send it to the list, but without response. It's still
>> pretty recent though, so hopefully the submitter comes back to us. If
>> not, someone could adopt it and resend to the list.
>
> Yes, I remember looking at this patch, and looking a bit inside the
> kernel for some details about why signed modules cannot be stripped. If
> I remember correctly, it is indeed true that they cannot be stripped.
> It's a bit annoying if they are built with debugging symbols...
>
>> procps Unknown HZ value! (XX) Assume 100.
>> toolchainfile.cmake has absolut path references
>> https://bugs.busybox.net/show_bug.cgi?id=6818
>> This bug contains a patch, and again the question was raised whether
>> the submitter could send it to the list instead. In the mean time it
>> was sent, so I closed the bug so the patch can follow the standard
>> patch review process. Is this ok? I marked it as Resolved/Fixed, which
>> is not the best state, but I couldn't find a better state...
>
> Yes, marked it as resolved, I'd say.
>
>> Checking external toolchain for eabihf
>> https://bugs.busybox.net/show_bug.cgi?id=6842
>> ThomasP: the bug report refers to a small patch, could you have a look at it?
>
> Will try to get to it.

Thanks!

Note to other developers: further feedback on the bug list I sent is
more than welcome!

Best regards,
Thomas
