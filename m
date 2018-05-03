From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 3 May 2018 18:27:53 +0200
Subject: [Buildroot] [PATCH] support/scripts/check-uniq-files: ignore
 reinstalled packages
In-Reply-To: <20180428212916.GA11792@scaer>
References: <20180426162731.4710-1-john@metanate.com>
 <1437404419.346987.1524766955385.JavaMail.zimbra@datacom.ind.br>
 <20180427113119.591e8441.john@metanate.com> <20180428212916.GA11792@scaer>
Message-ID: <CA+TH9V=SsKexf__0SoobmM7L817+C3d34E5vaRATB3QobsYAMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John,

2018-04-28 23:29 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> John, Henrique, All,
>
> On 2018-04-27 11:31 +0100, John Keeping spake thusly:
>> On Thu, 26 Apr 2018 15:22:35 -0300 (BRT)
>> Henrique Marks <henrique.marks@datacom.ind.br> wrote:
>> > ----- Mensagem original -----
>> > > De: "John Keeping" <john@metanate.com>
>> > > Para: buildroot at buildroot.org
>> > > Cc: "John Keeping" <john@metanate.com>
>> > > Enviadas: Quinta-feira, 26 de abril de 2018 13:27:31
>> > > Assunto: [Buildroot] [PATCH] support/scripts/check-uniq-files:
>> > > ignore reinstalled packages
>> >
>> > > If a package is rebuilt, then any files it installs will be listed
>> > > multiple times in the file list and check-uniq-files will report
>> > > that these files are touched by more than one package even though
>> > > it is the same package listed multiple times.
>> > >
>> > > Switch to storing the package names in a set so that each package
>> > > can only appear once.
>> >
>> > I can confirm we have problems rebuilding packages using buildroot
>> > 2018-02.1. The 3 files "package-file-list" are increasing in size
>> > when we rebuild packages (make <pkg>-rebuild or make
>> > <pkg>-reinstall), and the compilation time is increasing linearly
>> > with every rebuild, but the increase is noticeable.
>>
>> I hadn't considered this aspect of the problem.  Maybe we are better
>> fixing the root cause of the problem with a patch like this:
>>
>> -- >8 --
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 1c9dd1d734..edc2c9349c 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -64,6 +64,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>>  # $(3): suffix of file  (optional)
>>  define step_pkg_size_inner
>>       cd $(2); \
>> +     $(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt; \
>
> This means that a file that was previously installed by that package,
> but no longer is (e.g. because the install comands were "fixed" to no
> longer install it), will now be orphaned, and belong to no package.
>
> But I don't care about that situation, since only a clean build from
> scratch is known to provide good results anyway, and that is the only
> thing we want to ensure.
>
> So, please resend an updated patch to use this new solution.
>
> Please provide an extensive commit log that explains why we do remove
> the existign entries, and the limitations it has (e.g. orphaned files).

Could you respin this patch?

Thanks!

>
> Regards,
> Yann E. MORIN.
>
>>       find . \( -type f -o -type l \) \
>>               -newer $($(PKG)_DIR)/.stamp_built \
>>               -exec printf '$(1),%s\n' {} + \
>> -- 8< --
>>
>> But I don't know enough about the build process to know if this is safe
>> in the presence of top-level parallel build.
>>
>>
>> Regards,
>> John
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
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
