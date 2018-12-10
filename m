From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Dec 2018 23:47:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-12-09
In-Reply-To: <20181210070023.7542C207D4@mail.bootlin.com>
References: <20181210070023.7542C207D4@mail.bootlin.com>
Message-ID: <20181210224740.GA32623@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-12-10 08:00, Thomas Petazzoni wrote:

>         i686 |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/e9d94084be8ed3296ba63cffdb9d69ffcc3b7140 |

From the log:

```
udev-builtin-input_id.c:52:19: error: 'BTN_DPAD_UP' undeclared here (not
in a function)
         { KEY_OK, BTN_DPAD_UP },
```

It looks like this one (as well as the one for mips) is related to this
commit [1] in systemd's udev about Linux 3.11 compatibility:

- the i686 defconfig mentions BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
- the mips one has BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y.

Adding the following in src/shared/missing.h solves the issue:

```
/* available as of kernel 3.11 */
#ifndef BTN_DPAD_UP
#define BTN_DPAD_UP 0x220
#define BTN_DPAD_RIGHT 0x223
#endif /* BTN_DPAD_UP */
```

I'll shortly send a proper patch.

[1] https://github.com/systemd/systemd/pull/6267

Regards,

--
ELB
