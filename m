From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 25 Oct 2015 22:41:20 +0100
Subject: [Buildroot] [PATCH v5 02/36] package/libevas-generic-loaders:
 move to package directory
In-Reply-To: <20151025210402.GI11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-3-git-send-email-romain.naour@openwide.fr>
 <20151025125624.GD3665@free.fr> <562D2BA3.9020203@openwide.fr>
 <20151025210402.GI11692@free.fr>
Message-ID: <562D4C80.4030204@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 25/10/2015 22:04, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-25 20:21 +0100, Romain Naour spake thusly:
>> Le 25/10/2015 13:56, Yann E. MORIN a ?crit :
>>> On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
>>>> As for expedite package, there is no advantage for efl related
>>>> packages to share the same version number anymore
>>>> (except for efl and libelementary).
>>>>
>>>> Also, we usually do not have a sub-directory for a family of related
>>>> packages which doen't share the same version number, so move
>>>> libevas-generic-loaders to package directory.
>>>> Libevas-generic-loaders appear now in "Libraries" -> "Graphics" in
>>>> the Kconfig menu.
>>>>
>>>> While at it, remove BR2_USE_WCHAR dependency since the efl package
>>>> already depend on it.
>>>
>>> Are you sure that libevas-generic-loaders does not itself depend on
>>> wchar?
>>>
>>> If it does, then please keep the dependency, even if it is automatically
>>> inherited through the dependency on EFL. This is so, in case EFL loses
>>> its dependency on wchar, libevas-generic-loaders would still have its
>>> own.
>>
>> libevas-generic-loaders doesn't use wchar by itself, it's a reverse dependency
>> that come from librsvg which is required for svg support only.
> 
> OK, so if libevas-generic-loader does not need it, and does not have to
> inherit it through one of its select, then dropping is OK.
> 
>> So, IIUC when a package A select a package B, we must propagate all reverse
>> dependencies of the package B when the package A already depends on them
>> implicitly (i.e when using a depends on BR2_PACKAGE_C).
> 
> I'm not sure I groked what you wrote, so here's a litle example. Say you
> have a pacakge foo that needs bar and bar needs threads; here's how
> you'd express it:
> 
>     config foo
>         bool "foo"
>         depends on threads # bar
>         select bar
> 
>     config bar
>         bool "bar"
>         depends on threads

In my example based on libevas-generic-loaders, I had 3 packages:

     config foo
         bool "foo"
         depends on threads

     config bar
         bool "bar"
         depends on foo
         [depends on threads # baz]
         select baz

     config baz
         bool "baz"
         depends on threads

So foo and baz depends on threads, bar depends on foo.
The question is do we need to add [depends on threads # baz] for bar in that case ?
bar implicitly depends on threads thanks to foo dependency.

So, what I understand after your comment is that we must keep the reverse
dependency on threads for the package bar because it select baz.

> 
> Now, if package foo also needs threads for itself, here's how you'd
> express it:
> 
>     config foo
>         bool "foo"
>         depends on threads
>         select bar
> 
>     config bar
>         bool "bar"
>         depends on threads
> 
> Note that the threads dependency in foo no longer has the '# bar'
> comment.
> 
>> Also, in the libevas-generic-loaders bump I removed two other dependencies for
>> the same reason (BR2_TOOLCHAIN_HAS_THREADS and BR2_INSTALL_LIBSTDCPP):
>> http://lists.busybox.net/pipermail/buildroot/2015-October/142950.html
> 
> Hmm... I may have missed properly checkign that. If libevas-generic-loader
> does not need threads or C++, then you can indeed drop them. However, if
> it needs it, you must depend on them, even if you inherit them from the
> EFL dependency.
> 
> Looking at the libevas-generic-loader code, it seems there is no need
> for threads, so you can drop it.
> 
> As for C++, evas-generic-loader needs it: first, tis configure.ac has
> AC_PROG_CXX, and it has one C++ file, src/pdf/main.cpp. So you have to
> keep the dependency on C++.

Ok, I'll look at it latter the week, I'll try to resend a new series before the
next week-end.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
