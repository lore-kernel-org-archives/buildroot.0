From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 6 Apr 2017 16:29:26 -0400
Subject: [Buildroot] [PATCH v2 1/2] cracklib: New package
In-Reply-To: <20170406171949.5a13b942@free-electrons.com>
References: <20170405124234.7035-1-stefan.sorensen@spectralink.com>
 <20170406171949.5a13b942@free-electrons.com>
Message-ID: <CANxTyt5p8xdOUeAnW=8QQdkx7CaR-NWWTiFBsrJXzzkG1=d8xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 6, 2017 at 11:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Stefan,
>
> On Wed,  5 Apr 2017 14:42:33 +0200, Stefan S?rensen wrote:
>> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
>> ---
>
> I still see the same behavior:
>
> /home/thomas/projets/buildroot/output/host/usr/sbin/cracklib-format /home/thomas/dl/cracklib-words-2.9.6.gz | /home/thomas/projets/buildroot/output/host/usr/sbin/cracklib-packer /home/thomas/projets/buildroot/output/target/usr/share/cracklib/pw_dict
> skipping line: 1
> 4 3
> rm /home/thomas/projets/buildroot/output/target/usr/share/cracklib/cracklib-small
>
> And then in the target:
>
> $ ls -l output/target/usr/share/cracklib/*
> -rw-r--r-- 1 thomas thomas  360 avril  6 17:17 output/target/usr/share/cracklib/cracklib.magic
> -rw-r--r-- 1 thomas thomas 1024 avril  6 17:17 output/target/usr/share/cracklib/pw_dict.hwm
> -rw-r--r-- 1 thomas thomas   50 avril  6 17:17 output/target/usr/share/cracklib/pw_dict.pwd
> -rw-r--r-- 1 thomas thomas   16 avril  6 17:17 output/target/usr/share/cracklib/pw_dict.pwi
>
> i.e, the dictionary is empty (size is ridiculously small).

FWIW - it looks to me like the grep call in cracklib-format is
concluding that cracklib-words is a binary file:

    buildroot/output/host/usr/sbin/cracklib-format cracklib-words-2.9.6.gz

    ]
    ]]
    binaryfilestandardinputmatches

If the grep is patched to have a -a to force the file to be treated as
text, then you get big numbers:

    skipping line: 1
    warning: input out of order: 'ghabcdefghabcdefghabcdefghabcd'
should not follow 'habcdefghabcdefghabcdefghabcde' (line 55362)
    warning: input out of order: 'fghabcdefghabcdefghabcdefghabc'
should not follow 'ghabcdefghabcdefghabcdefghabcd' (line 55363)
    warning: input out of order: 'efghabcdefghabcdefghabcdefghab'
should not follow 'fghabcdefghabcdefghabcdefghabc' (line 55364)
    warning: input out of order: 'fghabcdefghabcdefghabcdefghabc'
should not follow 'ghabcdefghabcdefghabcdefghabcd' (line 55366)
    warning: input out of order: 'abcdefghi' should not follow
'fghabcdefghabcdefghabcdefghabc' (line 55367)
    1911513 1911512

Or, if you use an older cracklib-words, like
http://downloads.sourceforge.net/cracklib/cracklib-words-20080507.gz,
then this problem is also avoided.

Danomi -



>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
