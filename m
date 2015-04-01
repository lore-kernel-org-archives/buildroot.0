From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Wed, 1 Apr 2015 05:05:08 +0000
Subject: [Buildroot] clapack libraries missing?: buildroot-2014.11
In-Reply-To: <8b612d402130471485daafdd832b2d6a@exch13-mail05.win.slac.stanford.edu>
References: <CADDnATcLG1SbgVZ8TB08J_yHU5vF7vKTPdwUZnFvcgewoUFdEg@mail.gmail.com>, 
 <551AFE63.6050009@mind.be>,
 <8b612d402130471485daafdd832b2d6a@exch13-mail05.win.slac.stanford.edu>
Message-ID: <8328b17ed1d642209ea7133d18709de1@exch13-mail05.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Williams Jr., Ernest L. [ernesto at slac.stanford.edu]
Sent: Tuesday, March 31, 2015 5:13 PM
To: Arnout Vandecappelle; Ernest Williams; buildroot at busybox.net
Cc: D'Ewart, J. Mitch
Subject: Re: [Buildroot] clapack libraries missing?: buildroot-2014.11

________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Arnout Vandecappelle [arnout at mind.be]
Sent: Tuesday, March 31, 2015 1:06 PM
To: Ernest Williams; buildroot at busybox.net
Subject: Re: [Buildroot] clapack libraries missing?: buildroot-2014.11

On 30/03/15 16:51, Ernest Williams wrote:
> Hi,
>
> I am using "buildroot-2014.11"
> I am using glibc and my target is INTEL x86_64
> Version of CLAPACK:
> CLAPACK_VERSION = 3.2.1
>
> I would like to use clapack but missing the following libraries after the install:
>
> ***********************
> (1) lapack_LINUX.a
> (2) blas_LINUX.a
> (3) libF77.a
> (4) libI77.a
> ************************
>
> For includes I am also missing:
> *************************************
> "f2c.h"
> **************************************
>
>
> The only library, I see in the staging area is the following shared library:
> =============================
> liblapack.so
> =============================

 libblas.so should also be installed. And the header file is called clapack.h

 The f2c functionality is linked into these shared libraries, it shouldn't be
necessary to include or link with anything else.

============================================================
Okay, this is whta I have:

[ernesto at icd-pc90626 lib]$ ls liblapack*
liblapack.so*
[ernesto at icd-pc90626 lib]$ ls libblas.so
libblas.so*
[ernesto at icd-pc90626 lib]$ ls ../include/clapack.h
../include/clapack.h

I will run a test example this evening for a try.
========================================


My code does not compile:
clapack has types that are not defined :(

What other header file defines, "integer, "complex", "doublereal", "logical" , etc  ...?

/* header file for clapack 3.2.1 */

#ifndef __CLAPACK_H
#define __CLAPACK_H

/* Subroutine */ int caxpy_(integer *n, complex *ca, complex *cx, integer *
        incx, complex *cy, integer *incy);



Looks like  "f2c.h" is actually needed but was not installed.

Here is a small snippet from  "f2c.h" below:

*************** BEGIN Snippet from f2c.h  ***********************************
/* f2c.h  --  Standard Fortran to C header file */

/**  barf  [ba:rf]  2.  "He suggested using FORTRAN, and everybody barfed."

	- From The Shogakukan DICTIONARY OF NEW ENGLISH (Second edition) */

#ifndef F2C_INCLUDE
#define F2C_INCLUDE

typedef long int integer;
typedef unsigned long int uinteger;
typedef char *address;
typedef short int shortint;
typedef float real;
typedef double doublereal;
typedef struct { real r, i; } complex;
typedef struct { doublereal r, i; } doublecomplex;
typedef long int logical;
typedef short int shortlogical;
typedef char logical1;
typedef char integer1;
#ifdef INTEGER_STAR_8	/* Adjust for integer*8. */
typedef long long longint;		/* system-dependent */
typedef unsigned long long ulongint;	/* system-dependent */
#define qbit_clear(a,b)	((a) & ~((ulongint)1 << (b)))
#define qbit_set(a,b)	((a) |  ((ulongint)1 << (b)))
#endif

**************** END Snippet from f2c.h **************************************


*******************************************************
The application code is a simple example shown below:

#include <clapack.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>


#define NDIM 4 

int main (){

int i, j, info2;
int N, NRHS, LDA, LDB;
double *A;
double *B;
static int IPIV[NDIM], INFO;

A = (double*) malloc(NDIM*NDIM*sizeof(double));
B = (double*) malloc(NDIM*sizeof(double));

N=NDIM; NRHS=1; LDA=NDIM; LDB=NDIM;

A[0] = 1.0;
A[4] = -1.0;
A[8] = 2.0;
A[12] = -1.0;
A[1] = 2.0;
A[5] = -2.0;
A[9] = 3.0;
A[13] = -3.0;
A[2] = 1.0;
A[6] = 1.0;
A[10] = 1.0;
A[14] = 0.0;
A[3] = 1.0;
A[7] = -1.0;
A[11] = 4.0;
A[15] = 3.0;
    
    for (i=0;i<N;i++){
       for (j=0;j<N;j++) {
         printf("   %f  \n",A[i+N*j]);
       }
    }

   B[0] = -8.0; 
   B[1] = -20.0; 
   B[2] = -2.0;
   B[3] = 4.0;


   dgesv_(&N, &NRHS, A, &LDA, &IPIV, B, &LDB, &INFO);

printf("info %d \n",INFO);
 
   for (i=0;i<N;i++)
      printf("   %f \n",B[i]);
}
**************************************************************************************

Thanks again.


Cheers,
Ernest





 Regards,
 Arnout

>
>
> Cheers,
> Ernesto
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
