From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 8 Apr 2010 18:13:59 +0200
Subject: [Buildroot] Add a static image on DirectFB
In-Reply-To: <SNT129-W647B4DA73BD2184F98103CB9160@phx.gbl>
References: <SNT129-W647B4DA73BD2184F98103CB9160@phx.gbl>
Message-ID: <z2g4d28d4b51004080913k84333fc3ob735c8fc080253ee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wrong mailing list, but...

#include <stdio.h>
#include <unistd.h>
#include <directfb.h>

static IDirectFB *dfb = NULL;
static IDirectFBSurface *primary = NULL;
static int screen_width  = 0;
static int screen_height = 0;

#define DFBCHECK(x...)                                         \
  {                                                            \
    DFBResult err = x;                                         \
                                                               \
    if (err != DFB_OK)                                         \
      {                                                        \
        fprintf( stderr, "%s <%d>:\n\t", __FILE__, __LINE__ ); \
        DirectFBErrorFatal( #x, err );                         \
      }                                                        \
  }

int main (int argc, char **argv)
{
  DFBSurfaceDescription dsc;
  IDirectFBImageProvider *prov;

  DFBCHECK (DirectFBInit (&argc, &argv));
  DFBCHECK (DirectFBCreate (&dfb));
  DFBCHECK (dfb->SetCooperativeLevel (dfb, DFSCL_FULLSCREEN));

  dsc.flags = DSDESC_CAPS;
  dsc.caps  = DSCAPS_PRIMARY | DSCAPS_FLIPPING;

  DFBCHECK (dfb->CreateSurface( dfb, &dsc, &primary ));
  DFBCHECK (primary->GetSize (primary, &screen_width, &screen_height));
  DFBCHECK (dfb->CreateImageProvider (dfb, "/tmp/plop.jpg", &prov));
  DFBCHECK (prov->RenderTo (prov, primary, NULL));
  DFBCHECK (primary->Flip (primary, NULL, 0));

  sleep (5);

  primary->Release( primary );
  dfb->Release( dfb );

  return 42;
}


On Thu, Apr 8, 2010 at 6:04 PM, Tony Mozi <spooflinux@hotmail.fr> wrote:
> Hi,
> Currently, I work on 'Embedded Linux system development'. I'm on 'using a
> build system, example with Buildroot.
> I use the toolchain from buildroot and qemu.
> Examples from DirectFB library run.
> However, I don't know how add a static image, more precisely how run this
> image in order to see it on the background.
> Can you help me?
> BR
>
> ________________________________
> T?l?charger en toute s?curit? sur Internet ? La solution avec Internet
> Explorer 8
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
