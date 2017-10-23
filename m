From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:08:35 +0200
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <20171023203310.7ea017d0@gmx.net>
References: <1508584234482-0.post@n4.nabble.com>
 <87bml0cvqq.fsf@dell.be.48ers.dk> <1508618665952-0.post@n4.nabble.com>
 <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
 <1508620062609-0.post@n4.nabble.com>
 <bc9fed74-546a-a9f6-26b5-4698562b051e@mind.be>
 <1508775095198-0.post@n4.nabble.com> <20171023203310.7ea017d0@gmx.net>
Message-ID: <af5d514e-5ed8-179d-05ae-31b072cd5d15@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 20:33, Peter Seiderer wrote:
> Hello Kees,
> 
> On Mon, 23 Oct 2017 09:11:35 -0700 (MST), Kees van Unen <Keesvanunen@hotmail.com> wrote:
> 
>>> Copy the the make command line from the xlib_libX11, append V=1 to it, and 
>>> you'll see the compilation commands. Copy the compilation command for the 
>>> failing file, replace the -c with -E and the -o with some filename, so you
>>> get 
>>> the preprocessed file. Then in that preprocessed file check which stdlib.h
>>> it 
>>> includes. stdlib.h should be included from include/X11/Xlibint.h.   
>>
>> Hi, I managed to get the preprocessor file (see uploaded file). It includes
>> the next stdlib.h:
>>
>> output/host/arm-buildroot-linux-uclibc/gnueabihf/sysroot/usr/include/stdlib.h
>>
>> In this version of stdlib.h there is no reference to mblen (see uploaded
>> file).
>>
>> Regards,
>> Kees
>>
>> imCallbk.o
>> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/imCallbk.o>  
>> stdlib.h
>> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/stdlib.h>  
>>
> 
> Compared against local build (git master):
> 
> seiderer at localhost:~/Work/Buildroot/build-rpi0-xlib_libX11-1.6.5-mblen-error-001> wget http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/stdlib.h
> seiderer at localhost:~/Work/Buildroot/build-rpi0-xlib_libX11-1.6.5-mblen-error-001> diff -u stdlib.h ./host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdlib.h
> --- stdlib.h	2017-10-23 20:17:01.351394515 +0200
> +++ ./host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdlib.h	2017-10-21 23:29:09.028752219 +0200
> @@ -26,6 +26,7 @@
>  /* Get size_t, wchar_t and NULL from <stddef.h>.  */
>  #define		__need_size_t
>  #ifndef __need_malloc_and_calloc
> +#  define	__need_wchar_t
>  # define	__need_NULL
>  #endif
>  #include <stddef.h>
> @@ -138,7 +139,8 @@
>  #define	MB_CUR_MAX	(__ctype_get_mb_cur_max ())
>  extern size_t __ctype_get_mb_cur_max (void) __THROW __wur;
>  #else
> -# define	MB_CUR_MAX	1
> +# define	MB_CUR_MAX	(_stdlib_mb_cur_max ())
> +extern size_t _stdlib_mb_cur_max (void) __THROW __wur;
>  #endif
>  
>  
> @@ -825,6 +827,29 @@
>  #endif	/* use MISC || use X/Open Unix */
>  
>  
> +__BEGIN_NAMESPACE_STD
> +/* Return the length of the multibyte character
> +   in S, which is no longer than N.  */
> +extern int mblen (const char *__s, size_t __n) __THROW __wur;
> +/* Return the length of the given multibyte character,
> +   putting its `wchar_t' representation in *PWC.  */
> +extern int mbtowc (wchar_t *__restrict __pwc,
> +		   const char *__restrict __s, size_t __n) __THROW __wur;
> +/* Put the multibyte character represented
> +   by WCHAR in S, returning its length.  */
> +extern int wctomb (char *__s, wchar_t __wchar) __THROW __wur;
> +
> +
> +/* Convert a multibyte string to a wide char string.  */
> +extern size_t mbstowcs (wchar_t *__restrict  __pwcs,
> +			const char *__restrict __s, size_t __n) __THROW;
> +/* Convert a wide char string to multibyte string.  */
> +extern size_t wcstombs (char *__restrict __s,
> +			const wchar_t *__restrict __pwcs, size_t __n)
> +     __THROW;
> +__END_NAMESPACE_STD

 Right, so this is the bit that gets removed when BR2_TOOLCHAIN_BUILDROOT_WCHAR
is not set.

 Kees, is it possible that you changed the toolchain configuration and did not
do a 'make clean'? [1]

 [Rule 1 when somebody comes with a problem: did you do a make clean?]


 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#full-rebuild

> +
> +
>  #ifdef __USE_SVID
>  /* Determine whether the string value of RESPONSE matches the affirmation
>     or negative response expression as specified by the LC_MESSAGES category
> 
> Regards,
> Peter
> 
>>
>>
>>
>>
>>
>> --
>> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
