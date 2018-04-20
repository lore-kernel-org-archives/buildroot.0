From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 20 Apr 2018 09:28:09 +0200
Subject: [Buildroot] modem-manager: build issue
In-Reply-To: <20180420083813.0a2eac51@windsurf.numericable.fr>
References: <CAGm1_kusSpWv2dmQyzerpouB+LUvf84jZAi6rBMyZdieUUosow@mail.gmail.com>
 <1730967127.450971.1524062022318.JavaMail.zimbra@datacom.ind.br>
 <1847604074.751187.1524194593095.JavaMail.zimbra@datacom.ind.br>
 <20180420083813.0a2eac51@windsurf.numericable.fr>
Message-ID: <CAGm1_kuEqW+Mito5P8rMxdM+zrCFAxpu2TzsZa=mvDAK8d1e1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 20, 2018 at 8:38 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri, 20 Apr 2018 00:23:13 -0300 (BRT), Carlos Santos wrote:
>
>> There is a macro defined in build/libglib2-2.56.1/gobject/gobject.h which
>> leads to the assignment errors:
>>
>>   511 /* Make reference APIs type safe with macros */
>>   512 #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
>>
>> The problem can be easily reproduced with this sample code:
>>
>> $ cat /tmp/test.c
>> extern void *g_object_ref(void *);
>>
>> /* Make reference APIs type safe with macros */
>> #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
>>
>> extern double *new_double(int *);
>>
>> double *new_double(int *ip) {
>>   double *dp;
>>   dp = g_object_ref(ip);
>>   return dp;
>> }
>>
>> $ gcc -Wall -Werror -c /tmp/test.c -o /tmp/test.o
>> /tmp/test.c: In function ?new_context?:
>> /tmp/test.c:19:13: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
>>    ctx->self = g_object_ref(om);
>>              ^
>> cc1: all warnings being treated as errors
>
> Thanks for the investigation!
>
>> So in order to fix the build of ModemManager it would be necessary to either
>> compile it without -Werror (with the risk of letting undesired assignments
>> happen) or fix all the occurrences of the offending assignments.
>
> If the patch to fix all the occurrences is small enough, we can do this
> in Buildroot, and submit upstream.
>
> If the patch is larger, then disabling -Werror is a better solution for
> us, and report the issue upstream (or contribute the fix).

I still wonder why the upstream MM doesn't have any compilation
issues. cflags also have -Werror:

cflags:                  -Wall -Werror -std=gnu89 -g -O2
-Wmissing-declarations -Wmissing-prototypes
-Wdeclaration-after-statement -Wno-unused-parameter -Wno-sign-compare
-Wno-deprecated-declarations -Wno-unused-but-set-variable
-Wformat-security

And the code is also the same (src/mm-base-manager.c):

typedef struct {
    MMBaseManager *self;
    GDBusMethodInvocation *invocation;
    gchar *level;
} SetLoggingContext;

static gboolean
handle_set_logging (MmGdbusOrgFreedesktopModemManager1 *manager,
                    GDBusMethodInvocation *invocation,
                    const gchar *level)
{
    SetLoggingContext *ctx;

    ctx = g_new0 (SetLoggingContext, 1);
    ctx->self = g_object_ref (manager);
    ctx->invocation = g_object_ref (invocation);
    ctx->level = g_strdup (level);

    mm_auth_provider_authorize (ctx->self->priv->authp,
                                invocation,
                                MM_AUTHORIZATION_MANAGER_CONTROL,
                                ctx->self->priv->authp_cancellable,
                                (GAsyncReadyCallback)set_logging_auth_ready,
                                ctx);
    return TRUE;
}

@Aleksander: any ETA for 1.8.0?

Yegor
