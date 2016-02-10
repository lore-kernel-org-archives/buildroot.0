From: GabrielCastillo <gcastillo@controlnet.com.ar>
Date: Wed, 10 Feb 2016 09:40:39 -0800 (PST)
Subject: [Buildroot] Setting RGB
In-Reply-To: <20160204205505.5a842de4@gmx.net>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
 <20160204205505.5a842de4@gmx.net>
Message-ID: <1455126039107-125494.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using:
- SAMA5D3x
-Atmel
- The Display is a Multiino MI0500PT-7

I don't know if on QT4 works, but i need to make an App on QT5.

I have configure a panel-simple.c with:
 
static const struct drm_display_mode multiinno_mi0500pt_mode = {               
  ????.clock = 30000,                                                            
  ????.hdisplay = 800,                                                           
  ????.hsync_start = 800 + 2,                                                    
  ????.hsync_end = 800 + 2 + 41,                                                 
  ????.htotal = 800 + 2 + 41 + 2,                                                
  ????.vdisplay = 480,                                                           
  ????.vsync_start = 480 + 2,                                                    
  ????.vsync_end = 480 + 2 + 41,                                                 
  ????.vtotal = 480 + 2 + 41 + 2,                                                
  ????.vrefresh = 60,                                                            
  ????.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,                      
  };                                                                             
                                                                                 
  static const struct panel_desc multiinno_mi0500pt = {                          
  ????.modes = &multiinno_mi0500pt_mode,                                         
  ????.num_modes = 1,                                                            
  ????.bpc = 8,                                                                  
  ????.size = {                                                                  
  ????????.width = 108,                                                          
  ????????.height = 65,                                                          
  ????},                                                                         
  ????.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
};

and i change the DTS to include it:

????panel: panel {                                                             
         compatible = "multiinno,mi0500pt", "simple-panel";             
         backlight = <&backlight>;                                      
         power-supply = <&panel_reg>;                                   
         #address-cells = <1>;                                          
         #size-cells = <0>;                                             
         status = "okay";                                               
                                                                              
         port at 0 {                                                       
                reg = <0>;                                             
                #address-cells = <1>;                                  
                #size-cells = <0>;                                     
                                                                             
                panel_input: endpoint at 0 {                              
                        reg = <0>;                                     
                        remote-endpoint = <&hlcdc_panel_output>;       
                 };                                                     
        };                                                             
};   

That is all i do to include the new display.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Setting-RGB-tp124903p125494.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
