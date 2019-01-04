From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 4 Jan 2019 15:44:36 -0800
Subject: [Buildroot] Xtensa toolchain issue ?
In-Reply-To: <20190104102735.52e7e733@windsurf>
References: <20190102112130.0b8d32f8@windsurf>
 <CAMo8BfJR7vgLDONmKDX3S8RLyJBMYmXEKjjEr3JK5JOTHrd5hg@mail.gmail.com>
 <20190104102735.52e7e733@windsurf>
Message-ID: <CAMo8BfLe2amCfDH2MdrQH+7PXx16P5BjGy1zMe5gxZ+YkYEtxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 4, 2019 at 1:27 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Thu, 3 Jan 2019 14:17:51 -0800, Max Filippov wrote:
> > My understanding is that this is not something that could be fixed
> > in a generic way, but requires support from the compiler backend.
> > Specifically it needs a way to tail-call a variadic function from a
> > thunk,
>
> This is intricate compiler stuff. If you have a bit of time to give a
> few more details about this, I'd be interested. Of course, that's just
> to satisfy my endless curiosity, so if you don't have time/interest,
> you can skip this request :-)

A thunk function is used to implement C++ virtual function calls with
multiple inheritance. Probably the best explanation is a quote from
the gccint:

     These functions represent stub code that adjusts the 'this' pointer
     and then jumps to another function.  When the jumped-to function
     returns, control is transferred directly to the caller, without
     returning to the thunk.  The first parameter to the thunk is always
     the 'this' pointer; the thunk should add 'THUNK_DELTA' to this
     value.  (The 'THUNK_DELTA' is an 'int', not an 'INTEGER_CST'.)

     Then, if 'THUNK_VCALL_OFFSET' (an 'INTEGER_CST') is nonzero the
     adjusted 'this' pointer must be adjusted again.  The complete
     calculation is given by the following pseudo-code:

          this += THUNK_DELTA
          if (THUNK_VCALL_OFFSET)
            this += (*((ptrdiff_t **) this))[THUNK_VCALL_OFFSET]

     Finally, the thunk should jump to the location given by
     'DECL_INITIAL'; this will always be an expression for the address
     of a function.

and then later, in the description of macro
TARGET_ASM_OUTPUT_MI_THUNK:

     If you do not define this macro, the target-independent code in the
     C++ front end will generate a less efficient heavyweight thunk that
     calls FUNCTION instead of jumping to it.  The generic approach does
     not support varargs.

> Since the issue also happens on OpenRISC, perhaps we need to have some
> BR2_TOOLCHAIN_SUPPORTS_XYZ boolean that says whether the gcc version
> supports this specific stuff. However, since I don't clearly understand
> what the issue is, I wouldn't be able to find a good name for that
> BR2_TOOLCHAIN_SUPPORTS_XYZ option.
>
> BR2_TOOLCHAIN_SUPPORTS_TAIL_CALL_VARIADIC_FUNC_FROM_THUNK ? :-)

Maybe BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK?

-- 
Thanks.
-- Max
