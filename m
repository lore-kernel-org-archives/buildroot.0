From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 31 Aug 2018 16:23:41 +0200
Subject: [Buildroot] [PATCH next] squid: fix build failure on nios2
In-Reply-To: <20180831141735.32773-1-giulio.benetti@micronovasrl.com>
References: <20180831141735.32773-1-giulio.benetti@micronovasrl.com>
Message-ID: <d4890a27-5985-8536-d926-b63881480534@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 31/08/2018 16:17, Giulio Benetti ha scritto:
> libstdc++ can have ATOMIC_INT_LOCK_FREE < 2, this way exception_ptr.h
> containing current_exception() function won't be included causing build
> failure.
> 
> Add a patch to replace current_exception() with uncaught_exception()
> function. current_exception() is only used to check if there is a pending
> exception, uncaught_exception() does the same and does not rely on
> ATOMIC_INT_LOCK_FREE >= 2.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   ...place-current_exception-with-uncaugh.patch | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch
> 
> diff --git a/package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch b/package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch
> new file mode 100644
> index 0000000000..acd18a6f4f
> --- /dev/null
> +++ b/package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch
> @@ -0,0 +1,32 @@
> +From 14666035700bbabe699bdae4164d292cb04ca556 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Fri, 31 Aug 2018 15:54:21 +0200
> +Subject: [PATCH] TextException: replace current_exception() with
> + uncaught_exception()
> +
> +If libstdc++ has ATOMIC_INT_LOCK_FREE < 2 current_exception() is not supported.
> +
> +Since current_exception() is needed only to check if there are pending
> +exceptions, let's use uncaught_exception() instead.
> +

Sorry I've forgot to add:
"
Fixes:
http://autobuild.buildroot.net/results/273/273556771e957f109a1fbf446a5193aac49b72af/
http://autobuild.buildroot.net/results/9d2/9d2cde8494f69fedf0afc460d8e540d769a79212/
http://autobuild.buildroot.net/results/a71/a71db790ae3a3ea1836760edad504a92ea005cf7/
"

And failure happens with arm / arm926ej-s too, not only nios2.

I wait for any comments before resending patch as v2.

Thank you all
Giulio Benetti
