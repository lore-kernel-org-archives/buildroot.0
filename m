From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 5 Jun 2019 07:38:17 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-06-03
In-Reply-To: <20190604060132.577D1261F7@silver.osuosl.org>
References: <20190604060132.577D1261F7@silver.osuosl.org>
Message-ID: <20190605053816.GA13851@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 2019-06-04 06:00, Thomas Petazzoni wrote:
>      riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/725b7cf05a18479109f61b712f14e99a0e2fb784 |

The following autobuild issues are related:

- http://autobuild.buildroot.net/results/725b7cf05a18479109f61b712f14e99a0e2fb784
- http://autobuild.buildroot.net/results/c81b9009ce7b29a30102b15823a788ffab9fe8d7
- http://autobuild.buildroot.net/results/48c106e650bc85b5ce67bf4d8995adbf95184c9c

The build fails with:

```
error: failed to run custom build command for `libgit2-sys v0.6.19`
process didn't exit successfully: `/home/mark/buildroot-test/instance-0/output/build/host-cargo-0.26.0/target/release/build/libgit2-sys-c06c5b9b1557d938/build-script-build` (exit code: 101)
--- stdout
running: "cmake" "/home/mark/buildroot-test/instance-0/output/build/host-cargo-0.26.0/vendor/libgit2-sys/libgit2" "-DBUILD_SHARED_LIBS=OFF" "-DBUILD_CLAR=OFF" "-DCMAKE_INSTALL_PREFIX=/home/mark/buildroot-test/instance-0/output/build/host-cargo-0.26.0/target/release/build/libgit2-sys-e26df87de24b01ca/out" "-DCMAKE_C_FLAGS= -ffunction-sections -fdata-sections -fPIC -m64" "-DCMAKE_C_COMPILER=/usr/bin/cc" "-DCMAKE_CXX_FLAGS= -ffunction-sections -fdata-sections -fPIC -m64" "-DCMAKE_CXX_COMPILER=/usr/bin/c++" "-DCMAKE_BUILD_TYPE=Release"

--- stderr
cmake: /home/mark/buildroot-test/instance-0/output/host/lib/libcurl.so.4: no version information available (required by cmake)
cmake: symbol lookup error: /usr/lib/x86_64-linux-gnu/libxml2.so.2: undefined symbol: UCNV_TO_U_CALLBACK_STOP_60
thread 'main' panicked at '
command did not execute successfully, got: exit code: 12
```

So, libxml2.so from the system (/usr/lib/x86_64-linux-gnu/libxml2.so.2) is used
when linking, and it appears to be looking for symbols from ICU built without
--disable-renaming. I'll check why libgit2-sys wants to use this one.

Regards,

--
ELB
