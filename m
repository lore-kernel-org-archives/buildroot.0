From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 31 Aug 2018 19:23:57 +0200
Subject: [Buildroot] [PATCH next v2] ptpd2: fix ptpd2-ptp2 build failure
 due to EVP_MD_CTX conflict and U64 missing
In-Reply-To: <20180831074844.67710-1-giulio.benetti@micronovasrl.com>
References: <20180831074844.67710-1-giulio.benetti@micronovasrl.com>
Message-ID: <d34703ae-b714-d0c0-4de6-e8b69245e0fc@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 31/08/2018 09:48, Giulio Benetti ha scritto:
> In src/dep/ntpengine/ntp_isc_md5.* :
> EVP_MD_CTX typedef conflicts with openssl same name typedef EVP_MD_CTX.
> 
> In src/dep/snmp.c :
> U64 can be missing or conflicts with new perl as reported here:
> https://github.com/ptpd/ptpd/issues/25
> Use Ad Hoc patch since the one proposed on upstream [1] is too new and can't
> be applied to current version(2.3.1)
> 
> Add 2 patches to package to:
> - replace EVP_MD_CTX with EVP_MD5_CTX to avoid conflicts with openssl
> - replace U64 with struct counter64 to avoid to miss it with certain
> toolchains
> 
> Fixes:
> http://autobuild.buildroot.net/results/47b/47b99a6de256bfc0f5a8ae1484bb34e93b407237//
> http://autobuild.buildroot.net/results/083/08365fc559dda74640b9750358c82e84600a68ea//
> http://autobuild.buildroot.net/results/9b4/9b41c513500c63a9890973a0f17ffdb84d44d580//
> http://autobuild.buildroot.net/results/2ed/2ed79d01635c9a5e1018229dc6f4b7240a995b87//
> http://autobuild.buildroot.net/results/6d1/6d1b7e191f573334115684b85165f2bc27d75d8f//
> http://autobuild.buildroot.net/results/f54/f54c6fd841b3ea77dc12048c81f3f2991b679252//
> http://autobuild.buildroot.net/results/332/332bc77bcde0bef1b2fd7b9993409dd051c27cd6//
> http://autobuild.buildroot.net/results/4b4/4b416edaec9528d75a82c9570b8f8297718ca62d//
> 
> [1]: https://github.com/ptpd/ptpd/commit/99cbb146b6114fc5fd7b59a90ceb56c27e5ee700
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> * improved commit log
> 
>   ...5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch | 46 +++++++++++++++++++
>   ...mp-replace-U64-with-struct-counter64.patch | 30 ++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch
>   create mode 100644 package/ptpd2/0003-snmp-replace-U64-with-struct-counter64.patch
> 
> diff --git a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch
> new file mode 100644
> index 0000000000..4da355da94
> --- /dev/null
> +++ b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch
> @@ -0,0 +1,46 @@
> +From cd269dbd2c3c8cb8f1c627d1f0b85ee9712ac012 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Tue, 28 Aug 2018 20:49:06 +0200
> +Subject: [PATCH] ntp_isc_md5: rename EVP_MD_CTX into EVP_MD5_CTX
> +
> +EVP_MD_CTX can conflict with openssl.
> +Openssl defines a structure completely different but with same name.
> +
> +Since this typedef is used only twice in the entire ptpd, substitute
> +EVP_MD_CTX with EVP_MD5_CTX.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Sorry, I'm upstreaming this patch about EVP_MD_CTX and it's slightly 
different.
I didn't know about this workflow.
So once it is merged I'm going to resend this BR patch.

Sorry again.

Giulio Benetti
