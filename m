From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2018 21:34:31 +0000
Subject: [Buildroot] [Bug 11166] Erlang bad argument on valid uint64 when
 crosscompiled on 64-bit host
In-Reply-To: <bug-11166-163@https.bugs.busybox.net/>
References: <bug-11166-163@https.bugs.busybox.net/>
Message-ID: <bug-11166-163-8ma2c3cJVt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

Frank Vasquez <frankv@helium.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|2018.02                     |2018.02.1

--- Comment #5 from Frank Vasquez <frankv@helium.com> ---
Thank you for looking into this, Frank.  I'm relieved that Uint64 compiles to
"unsigned long long" on your 64-bit host.

> Can you check that sizeof(Uint64) is 8 in both your NIF and in Erlang when they're compiled?

I ran this test on our device.

Eshell V10.0  (abort with ^G)
1> byte_size(binary:encode_unsigned(16#ffffffffffffffff)).
8

I also instrumented erl_nif.c as follows and rebuilt Erlang.

int enif_inspect_binary(ErlNifEnv* env, Eterm bin_term, ErlNifBinary* bin)
{
    printf("enif_inspect_binary: size of Uint64 is %u\n", sizeof(Uint64));
    ...
}

And here is what I got when I opened a bitcask store on our device.

1> Handle = bitcask:open("some_db", [read_write]).
enif_inspect_binary: size of Uint64 is 8
                                        enif_inspect_binary: size of Uint64 is
8
                                                                               
#Ref<0.1026228257.3490185218.216151>

So both Erlang and erl_nif.c agree that the size of a Uint64 is 8 bytes.

Something odd I noticed is that instrumenting the suspect enif_get_uint64
resulted in no debug output when calling the bitcask:put function that is
throwing.

#if HAVE_INT64 && SIZEOF_LONG != 8 
int enif_get_int64(ErlNifEnv* env, ERL_NIF_TERM term, ErlNifSInt64* ip)
{
    return term_to_Sint64(term, ip);
}

int enif_get_uint64(ErlNifEnv* env, ERL_NIF_TERM term, ErlNifUInt64* ip)
{
    printf("enif_get_uint64: sizeof Uint64 is %u\n", sizeof(Uint64));
    /* return term_to_Uint64(term, ip); FIXME */
    return 1;
}
#endif /* HAVE_INT64 && SIZEOF_LONG != 8 */

It's as if enif_get_uint64 is never being executed.  I thought maybe the bad
arg exception was suppressing the printf so I modified enif_get_uint64 to
always return 1.  Erlang shell still reports bad arg exception at line 181.

> Also, is your simple example and Buildroot tree somewhere public?

The Buildroot tree for our device is currently still in a private GitHub repo
but I could create a similar Buildroot tree for a BeagleBone Black and publish
that for you to clone.  Our device is built on TI's Sitara AM5728 processor so
it is very similar to a BeagleBoard x15.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
