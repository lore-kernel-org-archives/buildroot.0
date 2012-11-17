From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 17 Nov 2012 22:11:00 +0000
Subject: [Buildroot] [PATCH v2] libusb: disable on avr32
In-Reply-To: <87ehjsrksw.fsf@dell.be.48ers.dk>
References: <1353186466-2269-1-git-send-email-spdawson@gmail.com>
 <87ehjsrksw.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCNvE-f7N=7n3XCoWsv2YK0qSK5D67f0zqF-Pae5AC3RDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter; thanks for the comments.

On 17 November 2012 21:17, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  spdawson> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
>  spdawson> index 985939e..a8a9e14 100644
>  spdawson> --- a/package/efl/libedbus/Config.in
>  spdawson> +++ b/package/efl/libedbus/Config.in
>  spdawson> @@ -15,6 +15,7 @@ if BR2_PACKAGE_LIBEDBUS
>
>  spdawson>  config BR2_PACKAGE_LIBEDBUS_BLUEZ
>  spdawson>      bool "bluez support"
>  spdawson> +    depends on !BR2_avr32 # libusb
>  spdawson>      select BR2_PACKAGE_BLUEZ_UTILS
>
> But bluez doesn't depend on libusb, only the BR2_PACKAGE_BLUEZ_UTILS_USB
> suboption (which should depend on !BR2_avr32).

Well, bluez-utils already depends as a whole on !BR2_avr32, so I don't
need to add that dependency to the BR2_PACKAGE_BLUEZ_UTILS_USB
suboption. However, I think the correct dependency information for the
BR2_PACKAGE_LIBEDBUS_BLUEZ suboption should probably be as follows.

  depends on !BR2_avr32 && BR2_USE_WCHAR # bluez-utils

That expresses all dependencies of bluez-utils (except for
BR2_TOOLCHAIN_HAS_THREADS, which is already an overall dependency of
BR2_PACKAGE_LIBEDBUS). Does that sound alright?

>  spdawson>  config BR2_PACKAGE_SCONESERVER_BLUETOOTH
>  spdawson>      bool "bluetooth"
>  spdawson> +    depends on !BR2_avr32 && BR2_USE_WCHAR && \
>  spdawson> +            BR2_TOOLCHAIN_HAS_THREADS # bluez-utils
>  spdawson>      select BR2_PACKAGE_BLUEZ_UTILS
>
> Same here.

If I'm right above, then this can stay as it is.

Simon.
