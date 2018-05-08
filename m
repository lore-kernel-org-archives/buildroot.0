From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 8 May 2018 15:40:28 +0200
Subject: [Buildroot] [PATCH v2] support/download/file: fix file://
 protocol handling
In-Reply-To: <20180508133428.GO14524@scaer>
References: <1525786111-6206-1-git-send-email-angelo@amarulasolutions.com>
 <20180508133428.GO14524@scaer>
Message-ID: <CA+TH9VniqaodD4yoLOJvRUgNKsxZ7WCU2oFPTtFW7FgNYB0vqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

2018-05-08 15:34 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Angelo, All,
>
> Thanks for the respin.
>
> On 2018-05-08 15:28 +0200, Angelo Compagnucci spake thusly:
>> When a file is used a source for download using the file:// protocol, a
>> malformed url is passed to the file download script which then crashes.
>> Following an example of a wrong path passed to the script:
>>
>> eval cp -v ''\''file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2'\''' ''\''/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/.armv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2.f403PT/output'\'''.
>>
>> Path passed to cp lacks of a / between dir and file part of the url,
>> moreover it presents a wrong file:// prefix.
>
> Well, the misisng / is indeed incorrect.
>
> However, the leading protocol is expected: the dl-wrapper calls all
> backend scripts with the exact same set of options and semantics. It's
> is then up to the backend scripts to interpret that as they see fit.
>
> So, it is not "semantically wrong"; it *is* correct.
>
> The bug lies in the fact that the 'file' backend did not strip out the
> protocol part when calling the actual tool; we missed that during the
> download overhaul.

Indeed I said "path passed to cp" not to the file backend. That is incorrect.

Should I rework my commit message?

>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> Fixes:
>>
>> cp: cannot stat
>> 'file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2':
>> No such file or directory
>>
>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>> ---
>>  support/download/file | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/support/download/file b/support/download/file
>> index fefd6d2..6dd37b0 100755
>> --- a/support/download/file
>> +++ b/support/download/file
>> @@ -40,4 +40,4 @@ _localfiles() {
>>      eval ${LOCALFILES} "${@}"
>>  }
>>
>> -_localfiles ${verbose} "'${dir}${file}'" "'${output}'"
>> +_localfiles ${verbose} "'${dir##file://}/${file}'" "'${output}'"
>> --
>> 2.7.4
>>
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
