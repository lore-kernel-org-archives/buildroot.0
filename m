From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Aug 2018 00:37:24 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-17
In-Reply-To: <20180818215603.04843f8d@windsurf>
References: <20180818060019.8702120DE6@mail.bootlin.com>
 <20180818215603.04843f8d@windsurf>
Message-ID: <20180819003724.04856da3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 18 Aug 2018 21:56:03 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Hollis, Fabrice, Chris, Peter, there are some issues/questions for you
> below.
> 
> On Sat, 18 Aug 2018 08:00:19 +0200 (CEST), Thomas Petazzoni wrote:
> 

[...]

> 
> >         or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a3535cdf5e91df011a59a4b9f60d69195f5efdcb |       
> 
> Missing "double conversion" logic for OpenRISC. Peter (Seiderer),
> perhaps you could have a look ? At
> https://github.com/google/double-conversion/issues/73, the upstream
> maintainer was OK with testing happening in Qemu.

	$ cat div.c 
double Div_double(double x, double y) { return x / y; }

	$ cat main.c
#include <stdio.h>

double Div_double(double x, double y);

int main(int argc, char** argv) {
  double result = Div_double(89255.0, 1e22);
  if (result == 89255e-22) {
    printf("correct result %e\n", result);
    return 1;
  } else {
    printf("wrong result %e\n", result);
    return 0;
  }
}

	$ ./build_qemu_or1k_001/host/bin/or1k-buildroot-linux-uclibc-gcc -c main.c
	$ ./build_qemu_or1k_001/host/bin/or1k-buildroot-linux-uclibc-gcc -c div.c
	$ ./build_qemu_or1k_001/host/bin/or1k-buildroot-linux-uclibc-gcc -o main main.o div.o

	$ ./qemu-3.0.0-or1k-install/bin/qemu-or1k -L build_qemu_or1k_001/staging main
correct result 8.925500e-18

Double-conversion test passed for or1k, buildroot qt5base patch will follow...

Regards,
Peter
