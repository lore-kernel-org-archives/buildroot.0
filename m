From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jun 2020 23:58:46 +0200
Subject: [Buildroot] [PATCH] package/gnutls: security bump to 3.6.14
In-Reply-To: <20200611053151.709390-1-stefan.sorensen@spectralink.com>
 (stefan's message of "Thu, 11 Jun 2020 07:31:51 +0200")
References: <20200611053151.709390-1-stefan.sorensen@spectralink.com>
Message-ID: <87r1u884ix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "stefan" == stefan  <stefan@astylos.dk> writes:

 > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > Fixes the following security issue:

 >  * CVE-2020-13777: It was found that GnuTLS 3.6.4 introduced a
 >    regression in the TLS protocol implementation. This caused the TLS
 >    server to not securely construct a session ticket encryption key
 >    considering the application supplied secret, allowing a MitM
 >    attacker to bypass authentication in TLS 1.3 and recover previous
 >    conversations in TLS 1.2

 > Release announcement:
 >  https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Did you test this on uClibc? I had a look at bumping the version earlier
this month and ended up with build issues because of a gnulib update:

  CC       getline.lo
  CC       localtime-buffer.lo
In file included from ./stdio.h:33:0,
                 from fopen.c:26:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:45:1: error: expected '=', ',', ';', 'asm' or '__a                                                                                                                                                                ttribute__' before 'typedef'
 typedef struct __STDIO_FILE_STRUCT FILE;
 ^
fopen.c:29:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'static'
 static FILE *
 ^
fopen.c:29:8: error: unknown type name 'FILE'
 static FILE *
        ^
In file included from /home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:71:0,
                 from ./stdio.h:33,
                 from stdio.h:43,
                 from fopen.c:38:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:227:29: error: unknown type name 'FIL                                                                                                                                                                 '
 extern int __fgetc_unlocked(FILE *__stream);
                             ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:228:38: error: unknown type name 'FIL                                                                                                                                                                 '
 extern int __fputc_unlocked(int __c, FILE *__stream);
                                      ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:247:8: error: unknown type name 'FILE'
 extern FILE *__stdin;   /* For getchar() macro. */
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:295:8: error: unknown type name 'FILE'
 extern FILE *__stdout;   /* For putchar() macro. */
        ^
In file included from ./stdio.h:33:0,
                 from stdio.h:43,
                 from fopen.c:38:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:134:8: error: unknown type name 'FILE'
 extern FILE *stdin;         /* Standard input stream.  */
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:135:8: error: unknown type name 'FILE'
 extern FILE *stdout;        /* Standard output stream.  */
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:136:8: error: unknown type name 'FILE'
 extern FILE *stderr;        /* Standard error output stream.  */
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:164:8: error: unknown type name 'FILE'
 extern FILE *__REDIRECT (tmpfile, (void), tmpfile64) __wur;
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:171:8: error: unknown type name 'FILE'
 extern FILE *tmpfile64 (void) __wur;
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:203:20: error: unknown type name 'FILE'
 extern int fclose (FILE *__stream);
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:208:20: error: unknown type name 'FILE'
 extern int fflush (FILE *__stream);
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:218:29: error: unknown type name 'FILE'
 extern int fflush_unlocked (FILE *__stream);
                             ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:249:8: error: unknown type name 'FILE'
 extern FILE *__REDIRECT (fopen, (const char *__restrict __filename,
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:252:8: error: unknown type name 'FILE'
 extern FILE *__REDIRECT (freopen, (const char *__restrict __filename,
        ^
In file included from /home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:395:0,
                 from /home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:27,
                 from ./stdio.h:33,
                 from stdio.h:43,
                 from fopen.c:38:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:252:14: error: unknown type name 'FILE'
 extern FILE *__REDIRECT (freopen, (const char *__restrict __filename,
              ^
In file included from ./stdio.h:33:0,
                 from stdio.h:43,
                 from fopen.c:38:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:263:8: error: unknown type name 'FILE'
 extern FILE *fopen64 (const char *__restrict __filename,
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:265:8: error: unknown type name 'FILE'
 extern FILE *freopen64 (const char *__restrict __filename,
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:267:4: error: unknown type name 'FILE'
    FILE *__restrict __stream) __wur;
    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:272:8: error: unknown type name 'FILE'
 extern FILE *fdopen (int __fd, const char *__modes) __THROW __wur;
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:278:8: error: unknown type name 'FILE'
 extern FILE *fopencookie (void *__restrict __magic_cookie,
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:285:8: error: unknown type name 'FILE'
 extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:291:8: error: unknown type name 'FILE'
 extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __THROW __wur;
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:298:21: error: unknown type name 'FILE'
 extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __THROW;
                     ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:302:21: error: unknown type name 'FILE'
 extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
                     ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:309:24: error: unknown type name 'FILE'
 extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
                        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:313:25: error: unknown type name 'FILE'
 extern void setlinebuf (FILE *__stream) __THROW;
                         ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:322:21: error: unknown type name 'FILE'
 extern int fprintf (FILE *__restrict __stream,
                     ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:338:22: error: unknown type name 'FILE'
 extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
                      ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:398:20: error: unknown type name 'FILE'
 extern int fscanf (FILE *__restrict __stream,
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:419:21: error: unknown type name 'FILE'
 extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
                     ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:443:19: error: unknown type name 'FILE'
 extern int fgetc (FILE *__stream);
                   ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:444:18: error: unknown type name 'FILE'
 extern int getc (FILE *__stream);
                  ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:462:27: error: unknown type name 'FILE'
 extern int getc_unlocked (FILE *__stream);
                           ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:473:28: error: unknown type name 'FILE'
 extern int fgetc_unlocked (FILE *__stream);
                            ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:485:28: error: unknown type name 'FILE'
 extern int fputc (int __c, FILE *__stream);
                            ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:486:27: error: unknown type name 'FILE'
 extern int putc (int __c, FILE *__stream);
                           ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:506:37: error: unknown type name 'FILE'
 extern int fputc_unlocked (int __c, FILE *__stream);
                                     ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:514:36: error: unknown type name 'FILE'
 extern int putc_unlocked (int __c, FILE *__stream);
                                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:522:18: error: unknown type name 'FILE'
 extern int getw (FILE *__stream);
                  ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:525:27: error: unknown type name 'FILE'
 extern int putw (int __w, FILE *__stream);
                           ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:534:52: error: unknown type name 'FILE'
 extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
                                                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:562:9: error: unknown type name 'FILE'
         FILE *__restrict __stream) __wur;
         ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:584:9: error: unknown type name 'FILE'
         FILE *__restrict __stream) __wur;
         ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:594:8: error: unknown type name 'FILE'
        FILE *__restrict __stream) __wur;
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:603:47: error: unknown type name 'FILE'
 extern int fputs (const char *__restrict __s, FILE *__restrict __stream);
                                               ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:616:29: error: unknown type name 'FILE'
 extern int ungetc (int __c, FILE *__stream);
                             ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:624:20: error: unknown type name 'FILE'
        size_t __n, FILE *__restrict __stream) __wur;
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:630:21: error: unknown type name 'FILE'
         size_t __n, FILE *__restrict __s) __wur;
                     ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:641:7: error: unknown type name 'FILE'
       FILE *__restrict __stream);
       ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:652:22: error: unknown type name 'FILE'
          size_t __n, FILE *__restrict __stream) __wur;
                      ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:654:23: error: unknown type name 'FILE'
           size_t __n, FILE *__restrict __stream) __wur;
                       ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:663:19: error: unknown type name 'FILE'
 extern int fseek (FILE *__stream, long int __off, int __whence);
                   ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:668:24: error: unknown type name 'FILE'
 extern long int ftell (FILE *__stream) __wur;
                        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:673:21: error: unknown type name 'FILE'
 extern void rewind (FILE *__stream);
                     ^
In file included from /home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:395:0,
                 from /home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:27,
                 from ./stdio.h:33,
                 from stdio.h:43,
                 from fopen.c:38:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:695:12: error: unknown type name 'FILE'
 extern int __REDIRECT (fseeko,
            ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:698:18: error: unknown type name 'FILE'
 extern __off64_t __REDIRECT (ftello, (FILE *__stream), ftello64);
                  ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:720:12: error: unknown type name 'FILE'
 extern int __REDIRECT (fgetpos, (FILE *__restrict __stream,
            ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:722:12: error: unknown type name 'FILE'
 extern int __REDIRECT (fsetpos,
            ^
In file included from ./stdio.h:33:0,
                 from stdio.h:43,
                 from fopen.c:38:
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:732:22: error: unknown type name 'FILE'
 extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
                      ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:733:28: error: unknown type name 'FILE'
 extern __off64_t ftello64 (FILE *__stream) __wur;
                            ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:734:23: error: unknown type name 'FILE'
 extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
                       ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:735:23: error: unknown type name 'FILE'
 extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);
                       ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:740:23: error: unknown type name 'FILE'
 extern void clearerr (FILE *__stream) __THROW;
                       ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:742:18: error: unknown type name 'FILE'
 extern int feof (FILE *__stream) __THROW __wur;
                  ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:744:20: error: unknown type name 'FILE'
 extern int ferror (FILE *__stream) __THROW __wur;
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:749:32: error: unknown type name 'FILE'
 extern void clearerr_unlocked (FILE *__stream) __THROW;
                                ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:750:27: error: unknown type name 'FILE'
 extern int feof_unlocked (FILE *__stream) __THROW __wur;
                           ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:751:29: error: unknown type name 'FILE'
 extern int ferror_unlocked (FILE *__stream) __THROW __wur;
                             ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:766:20: error: unknown type name 'FILE'
 extern int fileno (FILE *__stream) __THROW __wur;
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:771:29: error: unknown type name 'FILE'
 extern int fileno_unlocked (FILE *__stream) __THROW __wur;
                             ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:781:8: error: unknown type name 'FILE'
 extern FILE *popen (const char *__command, const char *__modes) __wur;
        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:787:20: error: unknown type name 'FILE'
 extern int pclose (FILE *__stream);
                    ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:806:24: error: unknown type name 'FILE'
 extern void flockfile (FILE *__stream) __THROW;
                        ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:810:26: error: unknown type name 'FILE'
 extern int ftrylockfile (FILE *__stream) __THROW __wur;
                          ^
/home/peko/source/buildroot/output-gnutls/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:813:26: error: unknown type name 'FILE'
 extern void funlockfile (FILE *__stream) __THROW;
                          ^
In file included from fopen.c:38:0:
stdio.h:782:1: error: unknown type name 'FILE'
 _GL_FUNCDECL_RPL (fopen, FILE *,
 ^
stdio.h:1223:1: error: unknown type name 'FILE'
 _GL_FUNCDECL_RPL (getdelim, ssize_t,
 ^
stdio.h:1266:1: error: unknown type name 'FILE'
 _GL_FUNCDECL_RPL (getline, ssize_t,
 ^
  CC       memchr.lo
fopen.c:47:1: error: unknown type name 'FILE'
 FILE *
 ^
fopen.c: In function 'rpl_fopen':
fopen.c:213:7: error: unknown type name 'FILE'
       FILE *fp;
       ^
fopen.c:230:10: warning: implicit declaration of function 'orig_fopen' [-Wimplicit-function-declaration]
   return orig_fopen (filename, mode);
          ^
fopen.c:230:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
make[6]: *** [Makefile:1981: fopen.lo] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [Makefile:1996: all-recursive] Error 1
make[4]: *** [Makefile:1835: all] Error 2
make[3]: *** [Makefile:1757: all-recursive] Error 1
make[2]: *** [Makefile:1682: all] Error 2
make[1]: *** [package/pkg-generic.mk:269: /home/peko/source/buildroot/output-gnutls/build/gnutls-3.6.14/.stamp_built] Error 2



Care to take a look?

-- 
Bye, Peter Korsgaard
