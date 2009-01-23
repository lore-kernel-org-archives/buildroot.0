From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 16:10:29 +0100
Subject: [Buildroot] ARM release compiler broken for mpg123.
Message-ID: <1232723429.5311.73.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?Have been struggling with mpg123 last night.
There seems to be a bug in the release version
(gcc-4.3.2/bu-2-19/uclibc-0.9.30)
of the toolchain which creates a Segment violation.

Anyone else can build mpg123, maybe for another architecture?
I have found an upstream patch, which I will test
and apply if it seems to solve the problem.


Reproduce using:

$ arm-linux-uclibc-gcc -Os -funroll-all-loops layer2.c


layer2.c:
-----------------------------------------------

#define FAIL
//#define WORKAROUND

struct al_table 
{
#if defined(FAIL)
  short bits;
#endif
  short d;
};

int getd_val;
int xd1;



struct al_table *alloc2;


void getd(void)
{
getd_val = alloc2->d;
}

int main(void)
{
int d1;

#if defined(WORKAROUND)
getd();
d1 = getd_val;
#else
d1 = alloc2->d;
#endif

#if defined(FAIL)
if( (d1) < 0)         {
xd1 = d1;
}
#else
xd1 = d1;
#endif
}

---------------------------------------

BR
Ulf Samuelsson
