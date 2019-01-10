From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 15:56:49 +0100
Subject: [Buildroot] Xtensa toolchain issue ?
In-Reply-To: <CAMo8BfLe2amCfDH2MdrQH+7PXx16P5BjGy1zMe5gxZ+YkYEtxQ@mail.gmail.com>
References: <20190102112130.0b8d32f8@windsurf>
 <CAMo8BfJR7vgLDONmKDX3S8RLyJBMYmXEKjjEr3JK5JOTHrd5hg@mail.gmail.com>
 <20190104102735.52e7e733@windsurf>
 <CAMo8BfLe2amCfDH2MdrQH+7PXx16P5BjGy1zMe5gxZ+YkYEtxQ@mail.gmail.com>
Message-ID: <20190110155649.2e5654cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Max,

On Fri, 4 Jan 2019 15:44:36 -0800, Max Filippov wrote:

> A thunk function is used to implement C++ virtual function calls with
> multiple inheritance. Probably the best explanation is a quote from
> the gccint:
> 
>      These functions represent stub code that adjusts the 'this' pointer
>      and then jumps to another function.  When the jumped-to function
>      returns, control is transferred directly to the caller, without
>      returning to the thunk.  The first parameter to the thunk is always
>      the 'this' pointer; the thunk should add 'THUNK_DELTA' to this
>      value.  (The 'THUNK_DELTA' is an 'int', not an 'INTEGER_CST'.)
> 
>      Then, if 'THUNK_VCALL_OFFSET' (an 'INTEGER_CST') is nonzero the
>      adjusted 'this' pointer must be adjusted again.  The complete
>      calculation is given by the following pseudo-code:
> 
>           this += THUNK_DELTA
>           if (THUNK_VCALL_OFFSET)
>             this += (*((ptrdiff_t **) this))[THUNK_VCALL_OFFSET]
> 
>      Finally, the thunk should jump to the location given by
>      'DECL_INITIAL'; this will always be an expression for the address
>      of a function.
> 
> and then later, in the description of macro
> TARGET_ASM_OUTPUT_MI_THUNK:
> 
>      If you do not define this macro, the target-independent code in the
>      C++ front end will generate a less efficient heavyweight thunk that
>      calls FUNCTION instead of jumping to it.  The generic approach does
>      not support varargs.

Thanks for the additional explanation, very useful!

> > Since the issue also happens on OpenRISC, perhaps we need to have some
> > BR2_TOOLCHAIN_SUPPORTS_XYZ boolean that says whether the gcc version
> > supports this specific stuff. However, since I don't clearly understand
> > what the issue is, I wouldn't be able to find a good name for that
> > BR2_TOOLCHAIN_SUPPORTS_XYZ option.
> >
> > BR2_TOOLCHAIN_SUPPORTS_TAIL_CALL_VARIADIC_FUNC_FROM_THUNK ? :-)  
> 
> Maybe BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK?

Sounds like a good name. Do you want to cook a patch for this, or
should I do so ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
